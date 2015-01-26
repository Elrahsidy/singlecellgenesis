// genesis

//Overall simulation parameters

float tmax = 1.0
float dt = 5.0e-5		// sec
floatformat %g
float refresh_factor = 10.0

// Central Q1 P23RSa current injection

float Q1_P23RSa_centralinj = 0.0

// Seeding the random number generator used later in the input pattern.
// Seeding with a defined number (integer) allows one to reproduce
// 'random' patterns from one simulation to the next.   Seeding
// without a defined seed gives different results each time you run
// the simulation.

randseed 34521

// setting the simulation clocks

setclock	0 {dt}		        // sec
setclock	1 {dt * refresh_factor} // sec

// Distributed Processing Setup

int display = 1		// display neurons and graphs
int output = 1		// don't dump neural output to a file

int batch = (display == 0)	// we are running interactively

echo Genesis started at {getdate}
echo "display = " {display}
echo "output = " {output}
echo "batch = " {batch}
echo ""

// variables
int i_am_Q1, i_am_Q2, i_am_Q3, i_am_Q4	// booleans indicating what cells are assigned
				                        //   to this node

// START UP
paron -parallel -silent 0 -nodes 4 -output o.out \
	-executable nxpgenesis
setfield /post msg_hang_time 100000	// set a very long timeout in case
					// we need to do debugging

// Label nodes (whereami)

i_am_Q1 = {mynode} == 0
i_am_Q2 = {mynode} == 1
i_am_Q3 = {mynode} == 2
i_am_Q4 = {mynode} == 3

echo I am node {mynode}
echo Completed startup at {getdate}

// Neocortex - Setup / Global Variables

int probedex
int probedex2
int gridsize
float sqrtgrdsz
float neuronfrac // Percentage of neurons receiving background

float	P23RSa_SEPX = 25e-6
float	P23RSa_SEPY = 25e-6
float	P23RSa_NX = 5
float	P23RSa_NY = 5

float	P23RSb_SEPX = 25e-6
float	P23RSb_SEPY = 25e-6
float	P23RSb_NX = 5
float	P23RSb_NY = 5

float	P23RSc_SEPX = 25e-6
float	P23RSc_SEPY = 25e-6
float	P23RSc_NX = 5
float	P23RSc_NY = 5

float	P23RSd_SEPX = 25e-6
float	P23RSd_SEPY = 25e-6
float	P23RSd_NX = 5
float	P23RSd_NY = 5

float	B23FS_SEPX = 25e-6
float	B23FS_SEPY = 25e-6
float	B23FS_NX = 5
float	B23FS_NY = 5

float	P5IBa_SEPX = 25e-6
float	P5IBa_SEPY = 25e-6
float	P5IBa_NX = 5
float	P5IBa_NY = 5

float	P5IBb_SEPX = 25e-6
float	P5IBb_SEPY = 25e-6
float	P5IBb_NX = 5
float	P5IBb_NY = 5

float	P5IBc_SEPX = 25e-6
float	P5IBc_SEPY = 25e-6
float	P5IBc_NX = 5
float	P5IBc_NY = 5

float	P5IBd_SEPX = 25e-6
float	P5IBd_SEPY = 25e-6
float	P5IBd_NX = 5
float	P5IBd_NY = 5

float	B5FS_SEPX = 25e-6
float	B5FS_SEPY = 25e-6
float	B5FS_NX = 5
float	B5FS_NY = 5

float	P6RSa_SEPX = 25e-6
float	P6RSa_SEPY = 25e-6
float	P6RSa_NX = 5
float	P6RSa_NY = 5

float	P6RSb_SEPX = 25e-6
float	P6RSb_SEPY = 25e-6
float	P6RSb_NX = 5
float	P6RSb_NY = 5

float	P6RSc_SEPX = 25e-6
float	P6RSc_SEPY = 25e-6
float	P6RSc_NX = 5
float	P6RSc_NY = 5

float	P6RSd_SEPX = 25e-6
float	P6RSd_SEPY = 25e-6
float	P6RSd_NX = 5
float	P6RSd_NY = 5

float	C23FS_SEPX = 25e-6
float	C23FS_SEPY = 25e-6
float	C23FS_NX = 5
float	C23FS_NY = 5

float	C5FS_SEPX = 25e-6
float	C5FS_SEPY = 25e-6
float	C5FS_NX = 5
float	C5FS_NY = 5

float	ST4RS_SEPX = 25e-6
float	ST4RS_SEPY = 25e-6
float	ST4RS_NX = 5
float	ST4RS_NY = 5

float	I23LTS_SEPX = 25e-6
float	I23LTS_SEPY = 25e-6
float	I23LTS_NX = 5
float	I23LTS_NY = 5

float	I5LTS_SEPX = 25e-6
float	I5LTS_SEPY = 25e-6
float	I5LTS_NX = 5
float	I5LTS_NY = 5

float	TCR_SEPX = 25e-6
float	TCR_SEPY = 25e-6
float	TCR_NX = 5
float	TCR_NY = 5

float	nRT_SEPX = 25e-6
float	nRT_SEPY = 25e-6
float	nRT_NX = 5
float	nRT_NY = 5

gridsize = P23RSa_NX*P23RSa_NY
probedex = gridsize/2
probedex2 = probedex/2

// Thalamocortical and Gaps flags
int thalamocortical = 1
int gaps = 1

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
   float vmin = -3.0
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

// Define P23RSa cells

include P23RSaprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P23RSacell.p /P23RSa

if ( {i_am_Q1} )

     setfield /P23RSa/apdend3 inject {Q1_P23RSa_centralinj}

end

P23RSa_synapsedefs

// Define P23RSb cells

include P23RSbprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P23RSbcell.p /P23RSb

P23RSb_synapsedefs

// Define P23RSc cells

include P23RScprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P23RSccell.p /P23RSc

P23RSc_synapsedefs

// Define P23RSd cells

include P23RSdprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P23RSdcell.p /P23RSd

P23RSd_synapsedefs

// Define B23FS cells

include B23FSprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell B23FScell.p /B23FS

B23FS_synapsedefs

// Define P5IBa cells

include P5IBaprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P5IBacell.p /P5IBa

P5IBa_synapsedefs

// Define P5IBb cells

include P5IBbprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P5IBbcell.p /P5IBb

P5IBb_synapsedefs

// Define P5IBc cells

include P5IBcprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P5IBccell.p /P5IBc

P5IBc_synapsedefs

// Define P5IBd cells

include P5IBdprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P5IBdcell.p /P5IBd

P5IBd_synapsedefs

// Define soma SPIKE outputs

// Define B5FS cells

include B5FSprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell B5FScell.p /B5FS

B5FS_synapsedefs

// Define P6RSa cells

include P6RSaprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P6RSacell.p /P6RSa

P6RSa_synapsedefs

// Define P6RSb cells

include P6RSbprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P6RSbcell.p /P6RSb

P6RSb_synapsedefs

// Define P6RSc cells

include P6RScprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P6RSccell.p /P6RSc

P6RSc_synapsedefs

// Define P6RSd cells

include P6RSdprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell P6RSdcell.p /P6RSd

P6RSd_synapsedefs

// Define C23FS cells

include C23FSprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell C23FScell.p /C23FS

C23FS_synapsedefs

// Define C5FS cells

include C5FSprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell C5FScell.p /C5FS

C5FS_synapsedefs

// Define ST4RS cells

include ST4RSprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell ST4RScell.p /ST4RS

ST4RS_synapsedefs

// Define I23LTS cells

include I23LTSprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell I23LTScell.p /I23LTS

I23LTS_synapsedefs

// Define I5LTS cells

include I5LTSprotodefs.g

// Build the cell from a parameter file using the cell reader
readcell I5LTScell.p /I5LTS

I5LTS_synapsedefs

// Define TCR cells

if ({thalamocortical == 1})

     include TCRprotodefs.g

// Build the cell from a parameter file using the cell reader

     readcell TCRcell.p /TCR

     TCR_synapsedefs


     include nRTprotodefs.g

// Build the cell from a parameter file using the cell reader

     readcell nRTcell.p /nRT

     nRT_synapsedefs

end

include spikedefs

// CREATE NETWORK CONNECTIONS

// Network definitions

P23RSa
P23RSb
P23RSc
P23RSd
B23FS
P5IBa
P5IBb
P5IBc
P5IBd
B5FS
P6RSa
P6RSb
P6RSc
P6RSd
C23FS
C5FS
ST4RS
I23LTS
I5LTS

if ({thalamocortical == 1})
     TCR
     nRT
end

// Synaptic weight decay parameters

float decayrate, maxwgt, minwgt

decayrate = 40000 // 1/(25e-6) m^-1
maxwgt = 1.0
minwgt = 0.0

// Create network for P23RSa cells

include P23RSa_P23RSa.g
include P23RSa_P23RSb.g
include P23RSa_P23RSc.g
include P23RSa_P23RSd.g
include P23RSa_B23FS.g
include P23RSa_P5IBa.g
include P23RSa_P5IBb.g
include P23RSa_P5IBc.g
include P23RSa_P5IBd.g
include P23RSa_B5FS.g
include P23RSa_P6RSa.g
include P23RSa_P6RSb.g
include P23RSa_P6RSc.g
include P23RSa_P6RSd.g
include P23RSa_C23FS.g
include P23RSa_C5FS.g
include P23RSa_ST4RS.g
include P23RSa_I23LTS.g
include P23RSa_I5LTS.g

// Create network for P23RSb cells

include P23RSb_P23RSa.g
include P23RSb_P23RSb.g
include P23RSb_P23RSc.g
include P23RSb_P23RSd.g
include P23RSb_B23FS.g
include P23RSb_P5IBa.g
include P23RSb_P5IBb.g
include P23RSb_P5IBc.g
include P23RSb_P5IBd.g
include P23RSb_B5FS.g
include P23RSb_P6RSa.g
include P23RSb_P6RSb.g
include P23RSb_P6RSc.g
include P23RSb_P6RSd.g
include P23RSb_C23FS.g
include P23RSb_C5FS.g
include P23RSb_ST4RS.g
include P23RSb_I23LTS.g
include P23RSb_I5LTS.g

// Create network for P23RSc cells

include P23RSc_P23RSa.g
include P23RSc_P23RSb.g
include P23RSc_P23RSc.g
include P23RSc_P23RSd.g
include P23RSc_B23FS.g
include P23RSc_P5IBa.g
include P23RSc_P5IBb.g
include P23RSc_P5IBc.g
include P23RSc_P5IBd.g
include P23RSc_B5FS.g
include P23RSc_P6RSa.g
include P23RSc_P6RSb.g
include P23RSc_P6RSc.g
include P23RSc_P6RSd.g
include P23RSc_C23FS.g
include P23RSc_C5FS.g
include P23RSc_ST4RS.g
include P23RSc_I23LTS.g
include P23RSc_I5LTS.g

// Create network for P23RSd cells

include P23RSd_P23RSa.g
include P23RSd_P23RSb.g
include P23RSd_P23RSc.g
include P23RSd_P23RSd.g
include P23RSd_B23FS.g
include P23RSd_P5IBa.g
include P23RSd_P5IBb.g
include P23RSd_P5IBc.g
include P23RSd_P5IBd.g
include P23RSd_B5FS.g
include P23RSd_P6RSa.g
include P23RSd_P6RSb.g
include P23RSd_P6RSc.g
include P23RSd_P6RSd.g
include P23RSd_C23FS.g
include P23RSd_C5FS.g
include P23RSd_ST4RS.g
include P23RSd_I23LTS.g
include P23RSd_I5LTS.g

// Create network for B23FS cells

include B23FS_P23RSa.g
include B23FS_P23RSb.g
include B23FS_P23RSc.g
include B23FS_P23RSd.g
include B23FS_B23FS.g
include B23FS_C23FS.g
include B23FS_ST4RS.g
include B23FS_I23LTS.g

// Create network for P5IBa cells

include P5IBa_P23RSa.g
include P5IBa_P23RSb.g
include P5IBa_P23RSc.g
include P5IBa_P23RSd.g
include P5IBa_B23FS.g
include P5IBa_P5IBa.g
include P5IBa_P5IBb.g
include P5IBa_P5IBc.g
include P5IBa_P5IBd.g
include P5IBa_B5FS.g
include P5IBa_P6RSa.g
include P5IBa_P6RSb.g
include P5IBa_P6RSc.g
include P5IBa_P6RSd.g
include P5IBa_C23FS.g
include P5IBa_C5FS.g
include P5IBa_ST4RS.g
include P5IBa_I23LTS.g
include P5IBa_I5LTS.g

// Create network for P5IBb cells

include P5IBb_P23RSa.g
include P5IBb_P23RSb.g
include P5IBb_P23RSc.g
include P5IBb_P23RSd.g
include P5IBb_B23FS.g
include P5IBb_P5IBa.g
include P5IBb_P5IBb.g
include P5IBb_P5IBc.g
include P5IBb_P5IBd.g
include P5IBb_B5FS.g
include P5IBb_P6RSa.g
include P5IBb_P6RSb.g
include P5IBb_P6RSc.g
include P5IBb_P6RSd.g
include P5IBb_C23FS.g
include P5IBb_C5FS.g
include P5IBb_ST4RS.g
include P5IBb_I23LTS.g
include P5IBb_I5LTS.g

// Create network for P5IBc cells

include P5IBc_P23RSa.g
include P5IBc_P23RSb.g
include P5IBc_P23RSc.g
include P5IBc_P23RSd.g
include P5IBc_B23FS.g
include P5IBc_P5IBa.g
include P5IBc_P5IBb.g
include P5IBc_P5IBc.g
include P5IBc_P5IBd.g
include P5IBc_B5FS.g
include P5IBc_P6RSa.g
include P5IBc_P6RSb.g
include P5IBc_P6RSc.g
include P5IBc_P6RSd.g
include P5IBc_C23FS.g
include P5IBc_C5FS.g
include P5IBc_ST4RS.g
include P5IBc_I23LTS.g
include P5IBc_I5LTS.g

// Create network for P5IBd cells

include P5IBd_P23RSa.g
include P5IBd_P23RSb.g
include P5IBd_P23RSc.g
include P5IBd_P23RSd.g
include P5IBd_B23FS.g
include P5IBc_P5IBa.g
include P5IBc_P5IBb.g
include P5IBc_P5IBc.g
include P5IBc_P5IBd.g
include P5IBd_B5FS.g
include P5IBd_P6RSa.g
include P5IBd_P6RSb.g
include P5IBd_P6RSc.g
include P5IBd_P6RSd.g
include P5IBd_C23FS.g
include P5IBd_C5FS.g
include P5IBd_ST4RS.g
include P5IBd_I23LTS.g
include P5IBd_I5LTS.g

// Create network for B5FS cells

include B5FS_P5IBa.g
include B5FS_P5IBb.g
include B5FS_P5IBc.g
include B5FS_P5IBd.g
include B5FS_B5FS.g
include B5FS_P6RSa.g
include B5FS_P6RSb.g
include B5FS_P6RSc.g
include B5FS_P6RSd.g
include B5FS_C5FS.g
include B5FS_ST4RS.g
include B5FS_I5LTS.g

// Create network for P6RSa cells

include P6RSa_P23RSa.g
include P6RSa_P23RSb.g
include P6RSa_P23RSc.g
include P6RSa_P23RSd.g
include P6RSa_B23FS.g
include P6RSa_P5IBa.g
include P6RSa_P5IBb.g
include P6RSa_P5IBc.g
include P6RSa_P5IBd.g
include P6RSa_B5FS.g
include P6RSa_P6RSa.g
include P6RSa_P6RSb.g
include P6RSa_P6RSc.g
include P6RSa_P6RSd.g
include P6RSa_C23FS.g
include P6RSa_C5FS.g
include P6RSa_ST4RS.g
include P6RSa_I23LTS.g
include P6RSa_I5LTS.g

if ({thalamocortical == 1})
     include P6RSa_TCR.g
     include P6RSa_nRT.g
end

// Create network for P6RSb cells

include P6RSb_P23RSa.g
include P6RSb_P23RSb.g
include P6RSb_P23RSc.g
include P6RSb_P23RSd.g
include P6RSb_B23FS.g
include P6RSb_P5IBa.g
include P6RSb_P5IBb.g
include P6RSb_P5IBc.g
include P6RSb_P5IBd.g
include P6RSb_B5FS.g
include P6RSb_P6RSa.g
include P6RSb_P6RSb.g
include P6RSb_P6RSc.g
include P6RSb_P6RSd.g
include P6RSb_C23FS.g
include P6RSb_C5FS.g
include P6RSb_ST4RS.g
include P6RSb_I23LTS.g
include P6RSb_I5LTS.g

if ({thalamocortical == 1})
     include P6RSb_TCR.g
     include P6RSb_nRT.g
end


// Create network for P6RSc cells

include P6RSc_P23RSa.g
include P6RSc_P23RSb.g
include P6RSc_P23RSc.g
include P6RSc_P23RSd.g
include P6RSc_B23FS.g
include P6RSc_P5IBa.g
include P6RSc_P5IBb.g
include P6RSc_P5IBc.g
include P6RSc_P5IBd.g
include P6RSc_B5FS.g
include P6RSc_P6RSa.g
include P6RSc_P6RSb.g
include P6RSc_P6RSc.g
include P6RSc_P6RSd.g
include P6RSc_C23FS.g
include P6RSc_C5FS.g
include P6RSc_ST4RS.g
include P6RSc_I23LTS.g
include P6RSc_I5LTS.g

if ({thalamocortical == 1})
     include P6RSc_TCR.g
     include P6RSc_nRT.g
end


// Create network for P6RSd cells

include P6RSd_P23RSa.g
include P6RSd_P23RSb.g
include P6RSd_P23RSc.g
include P6RSd_P23RSd.g
include P6RSd_B23FS.g
include P6RSd_P5IBa.g
include P6RSd_P5IBb.g
include P6RSd_P5IBc.g
include P6RSd_P5IBd.g
include P6RSd_B5FS.g
include P6RSd_P6RSa.g
include P6RSd_P6RSb.g
include P6RSd_P6RSc.g
include P6RSd_P6RSd.g
include P6RSd_C23FS.g
include P6RSd_C5FS.g
include P6RSd_ST4RS.g
include P6RSd_I23LTS.g
include P6RSd_I5LTS.g

if ({thalamocortical == 1})
     include P6RSd_TCR.g
     include P6RSd_nRT.g
end


// Create network for C23FS cells

include C23FS_P23RSa.g
include C23FS_P23RSb.g
include C23FS_P23RSc.g
include C23FS_P23RSd.g
include C23FS_P5IBa.g
include C23FS_P5IBb.g
include C23FS_P5IBc.g
include C23FS_P5IBd.g
include C23FS_P6RSa.g
include C23FS_P6RSb.g
include C23FS_P6RSc.g
include C23FS_P6RSd.g
include C23FS_ST4RS.g

// Create network for C5FS cells

include C5FS_P23RSa.g
include C5FS_P23RSb.g
include C5FS_P23RSc.g
include C5FS_P23RSd.g
include C5FS_P5IBa.g
include C5FS_P5IBb.g
include C5FS_P5IBc.g
include C5FS_P5IBd.g
include C5FS_P6RSa.g
include C5FS_P6RSb.g
include C5FS_P6RSc.g
include C5FS_P6RSd.g
include C5FS_ST4RS.g

//Create network for ST4RS cells

include ST4RS_P23RSa.g
include ST4RS_P23RSb.g
include ST4RS_P23RSc.g
include ST4RS_P23RSd.g
include ST4RS_B23FS.g
include ST4RS_P5IBa.g
include ST4RS_P5IBb.g
include ST4RS_P5IBc.g
include ST4RS_P5IBd.g
include ST4RS_B5FS.g
include ST4RS_P6RSa.g
include ST4RS_P6RSb.g
include ST4RS_P6RSc.g
include ST4RS_P6RSd.g
include ST4RS_ST4RS.g
include ST4RS_I23LTS.g
include ST4RS_I5LTS.g

//Create network for I23LTS cells

include I23LTS_P23RSa.g
include I23LTS_P23RSb.g
include I23LTS_P23RSc.g
include I23LTS_P23RSd.g
include I23LTS_B23FS.g
include I23LTS_P5IBa.g
include I23LTS_P5IBb.g
include I23LTS_P5IBc.g
include I23LTS_P5IBd.g
include I23LTS_B5FS.g
include I23LTS_P6RSa.g
include I23LTS_P6RSb.g
include I23LTS_P6RSc.g
include I23LTS_P6RSd.g
include I23LTS_C23FS.g
include I23LTS_C5FS.g
include I23LTS_ST4RS.g
include I23LTS_I23LTS.g
include I23LTS_I5LTS.g

//Create network for I5LTS cells

include I5LTS_P23RSa.g
include I5LTS_P23RSb.g
include I5LTS_P23RSc.g
include I5LTS_P23RSd.g
include I5LTS_B23FS.g
include I5LTS_P5IBa.g
include I5LTS_P5IBb.g
include I5LTS_P5IBc.g
include I5LTS_P5IBd.g
include I5LTS_B5FS.g
include I5LTS_P6RSa.g
include I5LTS_P6RSb.g
include I5LTS_P6RSc.g
include I5LTS_P6RSd.g
include I5LTS_C23FS.g
include I5LTS_C5FS.g
include I5LTS_ST4RS.g
include I5LTS_I23LTS.g
include I5LTS_I5LTS.g

//Create network for TCR cells

if ({thalamocortical == 1})

     include TCR_P23RSa.g
     include TCR_P23RSb.g
     include TCR_P23RSc.g
     include TCR_P23RSd.g
     include TCR_B23FS.g
     include TCR_P5IBa.g
     include TCR_P5IBb.g
     include TCR_P5IBc.g
     include TCR_P5IBd.g
     include TCR_B5FS.g 
     include TCR_P6RSa.g
     include TCR_P6RSb.g
     include TCR_P6RSc.g
     include TCR_P6RSd.g
     include TCR_C23FS.g
     include TCR_C5FS.g
     include TCR_ST4RS.g
     include TCR_nRT.g

end

//Create network for nRT cells

if ({thalamocortical == 1})

     include nRT_TCR.g
     include nRT_nRT.g

end

// Create Gap Junctions

if ({gaps == 1})

     include P23RSa_P23RSa_Gap.g
     include P23RSa_P23RSb_Gap.g
     include P23RSa_P23RSc_Gap.g
     include P23RSa_P23RSd_Gap.g

     include P23RSb_P23RSb_Gap.g
     include P23RSb_P23RSc_Gap.g
     include P23RSb_P23RSd_Gap.g

     include P23RSc_P23RSc_Gap.g
     include P23RSc_P23RSd_Gap.g

     include P23RSd_P23RSd_Gap.g

     include B23FS_B23FS_Gap.g

     include P5IBa_P5IBa_Gap.g
     include P5IBa_P5IBb_Gap.g
     include P5IBa_P5IBc_Gap.g
     include P5IBa_P5IBd_Gap.g

     include P5IBb_P5IBb_Gap.g
     include P5IBb_P5IBc_Gap.g
     include P5IBb_P5IBd_Gap.g

     include P5IBc_P5IBc_Gap.g
     include P5IBc_P5IBd_Gap.g

     include P5IBd_P5IBd_Gap.g

     include B5FS_B5FS_Gap.g

     include P6RSa_P6RSa_Gap.g
     include P6RSa_P6RSb_Gap.g
     include P6RSa_P6RSc_Gap.g
     include P6RSa_P6RSd_Gap.g

     include P6RSb_P6RSb_Gap.g
     include P6RSb_P6RSc_Gap.g
     include P6RSb_P6RSd_Gap.g

     include P6RSc_P6RSc_Gap.g
     include P6RSc_P6RSd_Gap.g

     include P6RSd_P6RSd_Gap.g

     include ST4RS_ST4RS_Gap.g

     include I23LTS_I23LTS_Gap.g

     include I5LTS_I5LTS_Gap.g

          if ({thalamocortical == 1})

               include nRT_nRT_Gap.g

          end

end

// Create Random Background Inputs

include synchansSPIKEs.g

neuronfrac=0.050

include P23RSa_raninput.g
include P23RSb_raninput.g
include P23RSc_raninput.g
include P23RSd_raninput.g

include B23FS_raninput.g

include P5IBa_raninput.g
include P5IBb_raninput.g
include P5IBc_raninput.g
include P5IBd_raninput.g

include B5FS_raninput.g

include P6RSa_raninput.g
include P6RSb_raninput.g
include P6RSc_raninput.g
include P6RSd_raninput.g

include C23FS_raninput.g
include C5FS_raninput.g

include ST4RS_raninput.g

include I23LTS_raninput.g
include I5LTS_raninput.g

if ({thalamocortical == 1})
 
     include TCR_raninput.g
     include nRT_raninput.g

end

// Output and diagnostics

// make the graphs to display Central Minicolumn somal Vm and pass messages to the graphs

//echo {probedex}

if ( {display == 1} && {i_am_Q1} )

     int posdex=1

     make_MasterRaster {probedex} {posdex}

     //make_Vmgraph P23RSa{probedex} 1 0
     //addmsg /P23RSanet/P23RSa[{probedex}]/soma /dataP23RSa{probedex}/VmP23RSa{probedex} PLOT Vm *volts *red

     //make_raster P23RSa{probedex} 1 0
     //addmsg /P23RSanet/P23RSa[{probedex}]/soma/spk1 /dataP23RSa{probedex}/spikeP23RSa{probedex} \ 
     //PLOTSCALE state *spike *red 0.01 0

     addmsg /P23RSanet/P23RSa[{probedex}]/soma/spk1 /rasterdata{probedex}/Spike{probedex} \ 
     PLOTSCALE state *P23RSa{probedex} *red 1.0 9.0

     //make_Vmgraph B23FS{probedex} 1 1
     //addmsg /B23FSnet/B23FS[{probedex}]/soma /dataB23FS{probedex}/VmB23FS{probedex} PLOT Vm *volts *blue

     addmsg /B23FSnet/B23FS[{probedex}]/soma/spk5 /rasterdata{probedex}/Spike{probedex} \ 
     PLOTSCALE state *B23FS{probedex} *blue 1.0 8.0

     //make_Vmgraph P5IBa{probedex} 1 2
     //addmsg /P5IBanet/P5IBa[{probedex}]/soma /dataP5IBa{probedex}/VmP5IBa{probedex} PLOT Vm *volts *red

     addmsg /P5IBanet/P5IBa[{probedex}]/soma/spk6 /rasterdata{probedex}/Spike{probedex} \ 
     PLOTSCALE state *P5IBa{probedex} *red 1.0 7.0

     //make_Vmgraph B5FS{probedex} 1 3
     //addmsg /B5FSnet/B5FS[{probedex}]/soma /dataB5FS{probedex}/VmB5FS{probedex} PLOT Vm *volts *blue

     addmsg /B5FSnet/B5FS[{probedex}]/soma/spk10 /rasterdata{probedex}/Spike{probedex} \ 
     PLOTSCALE state *B5FS{probedex} *blue 1.0 6.0

     //make_Vmgraph P6RSa{probedex} 2 0
     //addmsg /P6RSanet/P6RSa[{probedex}]/soma /dataP6RSa{probedex}/VmP6RSa{probedex} PLOT Vm *volts *red

     addmsg /P6RSanet/P6RSa[{probedex}]/soma/spk11 /rasterdata{probedex}/Spike{probedex} \ 
     PLOTSCALE state *P6RSa{probedex} *red 1.0 5.0

     //make_Vmgraph C23FS{probedex} 2 1
     //addmsg /C23FSnet/C23FS[{probedex}]/soma /dataC23FS{probedex}/VmC23FS{probedex} PLOT Vm *volts *blue

     addmsg /C23FSnet/C23FS[{probedex}]/soma/spk15 /rasterdata{probedex}/Spike{probedex} \ 
     PLOTSCALE state *C23FS{probedex} *blue 1.0 4.0

     //make_Vmgraph C5FS{probedex} 2 2
     //addmsg /C5FSnet/C5FS[{probedex}]/soma /dataC5FS{probedex}/VmC5FS{probedex} PLOT Vm *volts *blue

     addmsg /C5FSnet/C5FS[{probedex}]/soma/spk16 /rasterdata{probedex}/Spike{probedex} \ 
     PLOTSCALE state *C5FS{probedex} *blue 1.0 3.0

     //make_Vmgraph ST4RS{probedex} 2 3
     //addmsg /ST4RSnet/ST4RS[{probedex}]/soma /dataST4RS{probedex}/VmST4RS{probedex} PLOT Vm *volts *red

     addmsg /ST4RSnet/ST4RS[{probedex}]/soma/spk17 /rasterdata{probedex}/Spike{probedex} \ 
     PLOTSCALE state *ST4RS{probedex} *red 1.0 2.0

     //make_Vmgraph I23LTS{probedex} 1 4
     //addmsg /I23LTSnet/I23LTS[{probedex}]/soma /dataI23LTS{probedex}/VmI23LTS{probedex} PLOT Vm *volts *blue

     addmsg /I23LTSnet/I23LTS[{probedex}]/soma/spk18 /rasterdata{probedex}/Spike{probedex} \ 
     PLOTSCALE state *I23LTS{probedex} *blue 1.0 1.0

     //make_Vmgraph I5LTS{probedex} 2 4
     //addmsg /I5LTSnet/I5LTS[{probedex}]/soma /dataI5LTS{probedex}/VmI5LTS{probedex} PLOT Vm *volts *blue

     addmsg /I5LTSnet/I5LTS[{probedex}]/soma/spk19 /rasterdata{probedex}/Spike{probedex} \ 
     PLOTSCALE state *I5LTS{probedex} *blue 1.0 0.0

     if ({thalamocortical == 1})

         //make_Vmgraph TCR {probedex} 1 5
         //addmsg /TCRnet/TCR[{probedex}]/soma /dataTCR{probedex}/VmTCR{probedex} PLOT Vm *volts *blue

         addmsg /TCRnet/TCR[{probedex}]/soma/spk20 /rasterdata{probedex}/Spike{probedex} \ 
         PLOTSCALE state *TCR{probedex} *red  1.0 -1.0

         //make_Vmgraph nRT {probedex} 1 5
         //addmsg /nRTnet/nRT[{probedex}]/soma /datanRT{probedex}/VmnRT{probedex} PLOT Vm *volts *blue

         addmsg /nRTnet/nRT[{probedex}]/soma/spk21 /rasterdata{probedex}/Spike{probedex} \ 
         PLOTSCALE state *nRT{probedex} *blue  1.0 -2.0

     end

     posdex=2

     make_MasterRaster {probedex2} {posdex}

     //make_Vmgraph P23RSa{probedex2} -3 0
     //addmsg /P23RSanet/P23RSa[{probedex2}]/soma /dataP23RSa{probedex2}/VmP23RSa{probedex2} PLOT Vm *volts *red

     addmsg /P23RSanet/P23RSa[{probedex2}]/soma/spk1 /rasterdata{probedex2}/Spike{probedex2} \ 
     PLOTSCALE state *P23RS{probedex2} *red 1.0 9.0

     //make_Vmgraph B23FS{probedex2} -3 1
     //addmsg /B23FSnet/B23FS[{probedex2}]/soma /dataB23FS{probedex2}/VmB23FS{probedex2} PLOT Vm *volts *blue

     addmsg /B23FSnet/B23FS[{probedex2}]/soma/spk5 /rasterdata{probedex2}/Spike{probedex2} \ 
     PLOTSCALE state *B23FS{probedex2} *blue 1.0 8.0

     //make_Vmgraph P5IBa{probedex2} -3 2
     //addmsg /P5IBanet/P5IBa[{probedex2}]/soma /dataP5IBa{probedex2}/VmP5IBa{probedex2} PLOT Vm *volts *red

     addmsg /P5IBanet/P5IBa[{probedex2}]/soma/spk6 /rasterdata{probedex2}/Spike{probedex2} \ 
     PLOTSCALE state *P5IBa{probedex2} *red 1.0 7.0

     //make_Vmgraph B5FS{probedex2} -3 3
     //addmsg /B5FSnet/B5FS[{probedex2}]/soma /dataB5FS{probedex2}/VmB5FS{probedex2} PLOT Vm *volts *blue

     addmsg /B5FSnet/B5FS[{probedex2}]/soma/spk10 /rasterdata{probedex2}/Spike{probedex2} \ 
     PLOTSCALE state *B5FS{probedex2} *blue 1.0 6.0

     //make_Vmgraph P6RSa{probedex2} -2 0
     //addmsg /P6RSanet/P6RSa[{probedex2}]/soma /dataP6RSa{probedex2}/VmP6RSa{probedex2} PLOT Vm *volts *red

     addmsg /P6RSanet/P6RSa[{probedex2}]/soma/spk11 /rasterdata{probedex2}/Spike{probedex2} \ 
     PLOTSCALE state *P6RSa{probedex2} *red 1.0 5.0

     //make_Vmgraph C23FS{probedex2} -2 1
     //addmsg /C23FSnet/C23FS[{probedex2}]/soma /dataC23FS{probedex2}/VmC23FS{probedex2} PLOT Vm *volts *blue

     addmsg /C23FSnet/C23FS[{probedex2}]/soma/spk15 /rasterdata{probedex2}/Spike{probedex2} \ 
     PLOTSCALE state *C23FS{probedex2} *blue 1.0 4.0

     //make_Vmgraph C5FS{probedex2} -2 2
     //addmsg /C5FSnet/C5FS[{probedex2}]/soma /dataC5FS{probedex2}/VmC5FS{probedex2} PLOT Vm *volts *blue

     addmsg /C5FSnet/C5FS[{probedex2}]/soma/spk16 /rasterdata{probedex2}/Spike{probedex2} \ 
     PLOTSCALE state *C5FS{probedex2} *blue 1.0 3.0

     //make_Vmgraph ST4RS{probedex2} -2 3
     //addmsg /ST4RSnet/ST4RS[{probedex2}]/soma /dataST4RS{probedex2}/VmST4RS{probedex2} PLOT Vm *volts *red

     addmsg /ST4RSnet/ST4RS[{probedex2}]/soma/spk17 /rasterdata{probedex2}/Spike{probedex2} \ 
     PLOTSCALE state *ST4RS{probedex2} *red 1.0 2.0

     //make_Vmgraph I23LTS{probedex2} -3 4
     //addmsg /I23LTSnet/I23LTS[{probedex2}]/soma /dataI23LTS{probedex2}/VmI23LTS{probedex2} PLOT Vm *volts *blue

     addmsg /I23LTSnet/I23LTS[{probedex2}]/soma/spk18 /rasterdata{probedex2}/Spike{probedex2} \ 
     PLOTSCALE state *I23LTS{probedex2} *blue 1.0 1.0

     //make_Vmgraph I5LTS{probedex2} -2 4
     //addmsg /I5LTSnet/I5LTS[{probedex2}]/soma /dataI5LTS{probedex2}/VmI5LTS{probedex2} PLOT Vm *volts *blue

     addmsg /I5LTSnet/I5LTS[{probedex2}]/soma/spk19 /rasterdata{probedex2}/Spike{probedex2} \ 
     PLOTSCALE state *I5LTS{probedex2} *blue 1.0 0.0

     if ({thalamocortical == 1})
   
         //make_Vmgraph TCR {probedex2} 1 5
         //addmsg /TCRnet/TCR[{probedex2}]/soma /dataTCR{probedex2}/VmTCR{probedex2} PLOT Vm *volts *red

         addmsg /TCRnet/TCR[{probedex2}]/soma/spk20 /rasterdata{probedex2}/Spike{probedex2} \ 
         PLOTSCALE state *TCR{probedex2} *red  1.0 -1.0

         //make_Vmgraph nRT {probedex2} 1 5
         //addmsg /nRTnet/nRT[{probedex2}]/soma /datanRT{probedex2}/VmnRT{probedex2} PLOT Vm *volts *red

         addmsg /nRTnet/nRT[{probedex2}]/soma/spk21 /rasterdata{probedex2}/Spike{probedex2} \ 
         PLOTSCALE state *nRT{probedex2} *blue  1.0 -2.0

     end

end

//Setup messages for Data File writing

if ( {output == 1} )

    do_asc_file /home/pol1/Data/GenesisData/Neocortex/P23RSa{probedex}.dat /P23RSanet/P23RSa[{probedex}]/soma Vm P23RSa{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/B23FS{probedex}.dat /B23FSnet/B23FS[{probedex}]/soma Vm B23FS{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/P5IBa{probedex}.dat /P5IBanet/P5IBa[{probedex}]/soma Vm P5IBa{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/B5FS{probedex}.dat /B5FSnet/B5FS[{probedex}]/soma Vm B5FS{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/P6RSa{probedex}.dat /P6RSanet/P6RSa[{probedex}]/soma Vm P6RSa{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/C23FS{probedex}.dat /C23FSnet/C23FS[{probedex}]/soma Vm C23FS{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/C5FS{probedex}.dat /C5FSnet/C5FS[{probedex}]/soma Vm C5FS{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/ST4RS{probedex}.dat /ST4RSnet/ST4RS[{probedex}]/soma Vm ST4RS{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/I23LTS{probedex}.dat /I23LTSnet/I23LTS[{probedex}]/soma Vm I23LTS{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/I5LTS{probedex}.dat /I5LTSnet/I5LTS[{probedex}]/soma Vm I5LTS{probedex}

    do_asc_file /home/pol1/Data/GenesisData/Neocortex/P23RSaSPIKE{probedex}.dat /P23RSanet/P23RSa[{probedex}]/soma/spk1 state P23RSaSPIKE{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/B23FSSPIKE{probedex}.dat /B23FSnet/B23FS[{probedex}]/soma/spk5 state B23FSSPIKE{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/P5IBaSPIKE{probedex}.dat /P5IBanet/P5IBa[{probedex}]/soma/spk6 state P5IBaSPIKE{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/B5FSSPIKE{probedex}.dat /B5FSnet/B5FS[{probedex}]/soma/spk10 state B5FSSPIKE{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/P6RSaSPIKE{probedex}.dat /P6RSanet/P6RSa[{probedex}]/soma/spk11 state P6RSaSPIKE{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/C23FSSPIKE{probedex}.dat /C23FSnet/C23FS[{probedex}]/soma/spk15 state C23FSSPIKE{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/C5FSSPIKE{probedex}.dat /C5FSnet/C5FS[{probedex}]/soma/spk16 state C5FSSPIKE{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/ST4RSSPIKE{probedex}.dat /ST4RSnet/ST4RS[{probedex}]/soma/spk17 state ST4RSSPIKE{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/I23LTSSPIKE{probedex}.dat /I23LTSnet/I23LTS[{probedex}]/soma/spk18 state I23LTSSPIKE{probedex}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/I5LTSSPIKE{probedex}.dat /I5LTSnet/I5LTS[{probedex}]/soma/spk19 state I5LTSSPIKE{probedex}

    do_asc_file /home/pol1/Data/GenesisData/Neocortex/P23RSa{probedex2}.dat /P23RSanet/P23RSa[{probedex2}]/soma Vm P23RSa{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/B23FS{probedex2}.dat /B23FSnet/B23FS[{probedex2}]/soma Vm B23FS{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/P5IBa{probedex2}.dat /P5IBanet/P5IBa[{probedex2}]/soma Vm P5IBa{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/B5FS{probedex2}.dat /B5FSnet/B5FS[{probedex2}]/soma Vm B5FS{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/P6RSa{probedex2}.dat /P6RSanet/P6RSa[{probedex2}]/soma Vm P6RSa{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/C23FS{probedex2}.dat /C23FSnet/C23FS[{probedex2}]/soma Vm C23FS{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/C5FS{probedex2}.dat /C5FSnet/C5FS[{probedex2}]/soma Vm C5FS{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/ST4RS{probedex2}.dat /ST4RSnet/ST4RS[{probedex2}]/soma Vm ST4RS{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/I23LTS{probedex2}.dat /I23LTSnet/I23LTS[{probedex2}]/soma Vm I23LTS{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/I5LTS{probedex2}.dat /I5LTSnet/I5LTS[{probedex2}]/soma Vm I5LTS{probedex2}

    do_asc_file /home/pol1/Data/GenesisData/Neocortex/P23RSaSPIKE{probedex2}.dat /P23RSanet/P23RSa[{probedex2}]/soma/spk1 state P23RSaSPIKE{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/B23FSSPIKE{probedex2}.dat /B23FSnet/B23FS[{probedex2}]/soma/spk5 state B23FSSPIKE{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/P5IBaSPIKE{probedex2}.dat /P5IBanet/P5IBa[{probedex2}]/soma/spk6 state P5IBaSPIKE{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/B5FSSPIKE{probedex2}.dat /B5FSnet/B5FS[{probedex2}]/soma/spk10 state B5FSSPIKE{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/P6RSaSPIKE{probedex2}.dat /P6RSanet/P6RSa[{probedex2}]/soma/spk11 state P6RSaSPIKE{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/C23FSSPIKE{probedex2}.dat /C23FSnet/C23FS[{probedex2}]/soma/spk15 state C23FSSPIKE{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/C5FSSPIKE{probedex2}.dat /C5FSnet/C5FS[{probedex2}]/soma/spk16 state C5FSSPIKE{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/ST4RSSPIKE{probedex2}.dat /ST4RSnet/ST4RS[{probedex2}]/soma/spk17 state ST4RSSPIKE{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/I23LTSSPIKE{probedex2}.dat /I23LTSnet/I23LTS[{probedex2}]/soma/spk18 state I23LTSSPIKE{probedex2}
    do_asc_file /home/pol1/Data/GenesisData/Neocortex/I5LTSSPIKE{probedex2}.dat /I5LTSnet/I5LTS[{probedex2}]/soma/spk19 state I5LTSSPIKE{probedex2}

    // Spike Class Output ASCII

    do_classasc_file /home/pol1/Data/GenesisData/Neocortex/P23RSaSPIKE.dat /P23RSanet/P23RSa 1 {P23RSa_NX*P23RSa_NY} state P23RSaSPIKE
    do_classasc_file /home/pol1/Data/GenesisData/Neocortex/P23RSbSPIKE.dat /P23RSbnet/P23RSb 2 {P23RSb_NX*P23RSb_NY} state P23RSbSPIKE
    do_classasc_file /home/pol1/Data/GenesisData/Neocortex/P23RScSPIKE.dat /P23RScnet/P23RSc 3 {P23RSc_NX*P23RSc_NY} state P23RScSPIKE
    do_classasc_file /home/pol1/Data/GenesisData/Neocortex/P23RSdSPIKE.dat /P23RSdnet/P23RSd 4 {P23RSd_NX*P23RSd_NY} state P23RSdSPIKE

    do_classasc_file /home/pol1/Data/GenesisData/Neocortex/B23FSSPIKE.dat /B23FSnet/B23FS 5 {B23FS_NX*B23FS_NY} state B23FSSPIKE

    // Spike Class Output Binary

    do_classasc_filebin /home/pol1/Data/GenesisData/Neocortex/P23RSaSPIKEbin.dat /P23RSanet/P23RSa 1 {P23RSa_NX*P23RSa_NY} state P23RSaSPIKEbin
    do_classasc_filebin /home/pol1/Data/GenesisData/Neocortex/P23RSbSPIKEbin.dat /P23RSbnet/P23RSb 2 {P23RSb_NX*P23RSb_NY} state P23RSbSPIKEbin
    do_classasc_filebin /home/pol1/Data/GenesisData/Neocortex/P23RScSPIKEbin.dat /P23RScnet/P23RSc 3 {P23RSc_NX*P23RSc_NY} state P23RScSPIKEbin
    do_classasc_filebin /home/pol1/Data/GenesisData/Neocortex/P23RSdSPIKEbin.dat /P23RSdnet/P23RSd 4 {P23RSd_NX*P23RSd_NY} state P23RSdSPIKEbin

    do_classasc_filebin /home/pol1/Data/GenesisData/Neocortex/B23FSSPIKEbin.dat /B23FSnet/B23FS 5 {B23FS_NX*B23FS_NY} state B23FSSPIKEbin

end

//Control Routines

if ( {display == 1} && {i_am_Q1} )

//     make_control

end

//Neoorient

check
reset // This initialises and gets everything ready to go.

barrier
step_tmax // Run the sim to time tmax
