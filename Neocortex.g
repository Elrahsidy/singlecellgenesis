// genesis

// Random number generator: Use SPRNG instead of Numerical Recipes
setrand -sprng

//Overall simulation parameters

float tmax = 120
float dt = 5.0e-5		// sec
floatformat %g
float refresh_factor = 10.0

// Number of CPU nodes (= same as number of cortical columns)
int Nnodes = 16
int sqrtNnodes = {sqrt {Nnodes}}

// Number of minicolumns per cortical column.
// Each CPU node will simulate NX*NY minicolumns.
float NX = 8
float NY = 8

// Spacing between minicolumns
float SEPX = 25e-6
float SEPY = 25e-6

// Seeding the random number generator used later in the input pattern.
// Seeding with a defined number (integer) allows one to reproduce
// 'random' patterns from one simulation to the next.   Seeding
// without a defined seed gives different results each time you run
// the simulation.

int myrandseed = 34521
randseed {myrandseed}

// setting the simulation clocks

setclock	0 {dt}		        // sec
setclock	1 {dt * refresh_factor} // sec

// Distributed Processing Setup

int display = 0		// display neurons and graphs
int output = 1		// don't dump neural output to a file

// Thalamocortical and Gaps flags
int thalamocortical
int gaps

gaps = 0   // Gap junction flag
thalamocortical = 1 // TC flag

//int batch = (display == 0)	// we are running interactively

echo Genesis started at {getdate}
echo "display = " {display}
echo "output = " {output}
//echo "batch = " {batch}
echo ""

// START UP
paron -parallel -silent 0 -nodes {Nnodes} -output o.out \
	-executable nxpgenesis
//setfield /post msg_hang_time 100000	// set a very long timeout in case
					// we need to do debugging

str myzeropadnode
if({mynode} == 0)
    str myzeropadnode = "column00"
elif({mynode} < 10)
    str myzeropadnode = {"column0" @ {mynode}}
else
    str myzeropadnode = {"column" @ {mynode}}
end

//echo I am node {mynode}
echo I am node {myzeropadnode}
echo Completed startup at {getdate}

// Neocortex - Setup / Global Variables

int probedex
int probedex2
int gridsize
float sqrtgrdsz
float neuronfrac // Percentage of neurons receiving background

// Flags for minicolumnar architecture

int columntype       // 0 = standard column, all cell types represented in each Minicolumn
                     // 1 = Traub like columns

columntype = 1

// Load Network cell spacings and cell numbers

include netparams.g

// Central Q00 P23RSa current injection

float Q00_P23RSa_centralinj = 0.0

gridsize = P23RSa_NX*P23RSa_NY
probedex = gridsize/2
probedex2 = probedex/2

//===============================
//      Function Definitions
//===============================

function step_tmax
    step {tmax} -time
end

//function make_control(index)
function make_control    
    int index
    create xform /control [50,50,300,145]
    create xlabel /control/label -hgeom 50 -bg cyan -label "CONTROL PANEL"
    create xbutton /control/RESET -wgeom 33%       -script reset
    create xbutton /control/RUN  -xgeom 0:RESET -ygeom 0:label -wgeom 33% \
         -script step_tmax
    create xbutton /control/QUIT -xgeom 0:RUN -ygeom 0:label -wgeom 34% \
        -script quit
    create xdialog /control/Injection -label "Injection Central P23RSa(A)" \
		-value 0.0 -script "set_inject <widget>"
    xshow /control
end

function make_Vmgraph(class,xoffset,yoffset)
    int yoffset = 210*yoffset
    int xoffset = 575+190*xoffset
    float vmin = -0.100
    float vmax = 0.05
    create xform /data{class} [{xoffset},{yoffset},175,175]
    //create xlabel /data{class}/label -hgeom 10% 
    create xgraph /data{class}/Vm{class}  -hgeom 90%  -title {class}
    setfield ^ XUnits sec YUnits V
    setfield ^ xmax {tmax} ymin {vmin} ymax {vmax}
    xshow /data{class}
end

function make_raster(class,xoffset,yoffset)
    int yoffset = 210*yoffset
    int xoffset = 575+190*xoffset
    float vmin = -0.010
    float vmax = 0.02
    create xform /data{class} [{xoffset},{yoffset},175,175]
    //create xlabel /data{class}/label -hgeom 10% 
    create xgraph /data{class}/spike{class}  -hgeom 90%  -title {class}
    setfield ^ XUnits sec YUnits V
    setfield ^ xmax {tmax} ymin {vmin} ymax {vmax}
    xshow /data{class}
end

function make_rasterline(class,index)

   int index
   float vmin = -0.010
   float vmax = 0.110
  
   create xgraph /rasterdata/spike{class} -hgeom 90%

   setfield ^ XUnits sec YUnits V
   setfield ^ xmax {tmax} ymin {vmin} ymax {vmax}

   create xlabel /rasterdata/label{index} [0,0,30%,50%] \
                 -label {class}                         \     
                 -fg red

end

function make_MasterRaster(index,jdex)
   int index
   int jdex
   int yoffset = 50
   int xoffset = 0+({jdex}-1)*600
   float vmin = -4.0
   float vmax = 11.0
   create xform /rasterdata{index} [{xoffset},{yoffset},600,1000]

   create xgraph /rasterdata{index}/Spike{index} -hgeom 100%

   setfield ^ XUnits sec YUnits V
   setfield ^ xmax {tmax} ymin {vmin} ymax {vmax}

   xshow /rasterdata{index}
end


function set_inject(dialog)
        str dialog
        setfield /P23RSanet/P23RSa[{probedex}]/apdend3 inject {getfield {dialog} value}
end

//===============================
//          Data Out
//===============================

function do_asc_file(diskpath, srcpath, field, fd)

        create asc_file /{fd}
        setfield /{fd} filename {diskpath} flush 1 leave_open 1 append 0 float_format %0.9g

        addmsg {srcpath} /{fd}  SAVE {field}

end

//===============================
//    Spike Class  Data Out ASCII
//===============================

function do_classasc_file(diskpath, srcpath, classdex, Nelements, field, fd)

        int Nelements, classdex
        int i

        create asc_file /{fd}
        setfield /{fd} filename {diskpath} flush 1 leave_open 1 append 0 float_format %0.9g

        for (i=1;i<={Nelements};i=i+1)

            addmsg {srcpath}[{i-1}]/soma/spk{classdex} /{fd}  SAVE {field}
        
        end

end

//================================
//    Spike Class  Data Out Binary
//================================

function do_classasc_filebin(diskpath, srcpath, classdex, Nelements, field, fd)

        int Nelements, classdex
        int i

        create disk_out /{fd}
        setfield /{fd} filename {diskpath} flush 1 leave_open 1 append 0

        for (i=1;i<={Nelements};i=i+1)

            addmsg {srcpath}[{i-1}]/soma/spk{classdex} /{fd}  SAVE {field}
        
        end

end

//===============================
//      Set up Network
//===============================

//Table of synaptic conductances

include syncond.g

// Load cell definitions

include celldefs.g

// Define soma SPIKE outputs

include spikedefs.g

// CREATE NETWORK CONNECTIONS

// Network definitions

barrierall

include config_neuron/spatiallayout/P23RSa.g
include config_neuron/spatiallayout/P23RSb.g
include config_neuron/spatiallayout/P23RSc.g
include config_neuron/spatiallayout/P23RSd.g
include config_neuron/spatiallayout/B23FS.g
include config_neuron/spatiallayout/P5IBa.g
include config_neuron/spatiallayout/P5IBb.g
include config_neuron/spatiallayout/P5IBc.g
include config_neuron/spatiallayout/P5IBd.g
include config_neuron/spatiallayout/B5FS.g
include config_neuron/spatiallayout/P6RSa.g
include config_neuron/spatiallayout/P6RSb.g

if ({columntype == 0})

     include config_neuron/spatiallayout/P6RSc.g
     include config_neuron/spatiallayout/P6RSd.g

end

include config_neuron/spatiallayout/C23FS.g
include config_neuron/spatiallayout/C5FS.g
include config_neuron/spatiallayout/ST4RS.g
include config_neuron/spatiallayout/I23LTS.g
include config_neuron/spatiallayout/I5LTS.g

if ({thalamocortical == 1})
     include config_neuron/spatiallayout/TCR.g
     include config_neuron/spatiallayout/nRT.g
end

include config_neuron/spatiallayout/P23FRBa.g
include config_neuron/spatiallayout/P5RSa.g

// Revert to non-node-, typenum-, and minicolumn-dependent random seed (same
// number across all cores). Adding one so that we're not re-using the same
// random numbers (even though they were for different things).
randseed { {myrandseed} + 1 }

barrierall

// Synaptic weight decay parameters and delays

// ayu: synapticprobsbase.g is not an appropriate substitution for
// synapticprobsTraub.g because every neurontype_x_neurontype probability is
// set to 1. It was probably used for testing. Moving to vestigial/.
//include synapticprobsbase.g

barrierall
include synapticprobsTraub.g
barrierall

barrierall
include synapticdelays.g
barrierall

barrierall
include axonaldelays.g
barrierall

//Establish Wiring

include netdefs.g

barrierall

echo Made it past netdefs.g! {mynode}

// Create Gap Junctions

if ({gaps == 1})

     barrierall
     include Gapdefs.g
     barrierall

end

// Create Random Background Inputs

include synchansSPIKEs.g

neuronfrac=0.005

include randominputdefs.g

// Output and diagnostics

// Local field potential calculation

//include LFP.g
include config_dataoutput/LFP5e.g

// make the graphs to display 2 selected Minicolumns' somal Vm and pass messages to the graphs

//echo {probedex}

if ( {display == 1} && {{mynode} == 0} )

     int posdex=1

     make_MasterRaster {probedex} {posdex}

     if ({columntype == 0})
 
          include gui/probedices.g

     end

     if ({columntype == 1})

          include gui/probedicesTraub.g

     end

     include gui/rasterdefspos1.g

     posdex=2

     make_MasterRaster {probedex2} {posdex}

     if ({columntype == 0})
 
          include gui/probedices2.g

     end

     if ({columntype == 1})

          include gui/probedices2Traub.g

     end

     include gui/rasterdefspos2.g

end

//Setup messages for Data File writing

if ( {output == 1} )

    // LFP data write

    include config_dataoutput/LFP5eASCIIwrite.g

    // Vm files probedex

    // probedex and probedex2 ASCII file Vm and Spike writing

    include config_dataoutput/ASCIIwrite.g

    // Spike Class Output ASCII

    include config_dataoutput/ASCIISpikeClasswrite.g

    // Spike Class Output Binary

    //include config_dataoutput/BinarySpikeClasswrite.g

end

//Control Routines

if ( {display == 1} && {{mynode} == 0} )

//     make_control

end

//Neoorient

check
reset // This initialises and gets everything ready to go.

// Output entire hierarchy for debugging (takes a *huge* amount of disk space!)
//le / -recursive -type

// List all connections: Takes forever to run!!! Also, only works well on a
// single node model because multi-node models don't show the targets of
// node-to-node connections running into /post; this gives me very limited
// ability to see what's connected to what across columns.
//include draw_tree

barrier
step_tmax // Run the sim to time tmax
