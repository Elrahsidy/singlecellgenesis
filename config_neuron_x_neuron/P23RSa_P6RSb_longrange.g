// genesis

// grep "^[P]" ../neuron_type_list.txt | while read srcneuron srcspknum; do grep "^[PIBC]" ../neuron_type_list.txt | while read destneuron destspknum; do echo SRC=$srcneuron DEST=$destneuron; locations="`grep 'str locations = "apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10"

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

//float destlim = {P23RSa_P6RSb_destlim}
float destlim = 1.0 // being lazy; should calculate based on model size instead

/*
 * Usage :
 * volumeconnect source-path destination-path
 *		 [-relative]
 *		 [-sourcemask {box,ellipse} x1 y1 x2 y2]
 *		 [-sourcehole {box,ellipse} x1 y1 x2 y2]
 *		 [-destmask   {box,ellipse} x1 y1 x2 y2]
 *		 [-desthole   {box,ellipse} x1 y1 x2 y2]
 *		 [-probability p]
 */

echo Making connections from the P23RSa cells to the P6RSb cells.

//P23RSa - P6RSb AMPA
str s
//Load synapse location array
str locations = "apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10"

foreach s ({arglist {locations}})

    barrierall //ayu
    volumeconnect /P23RSanet/P23RSa[]/soma/spk1longrange  \
	      /P6RSbnet/P6RSb[]/{s}/Ex_ch12P23RSAMPA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {{longrangeprobscale}*{P23RSa_P6RSb_prob}}
          //-probability 0.5

end

//P23RSa - P6RSb NMDA
str s
//Load synapse location array
str locations = "apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10"

foreach s ({arglist {locations}})

    barrierall //ayu
    volumeconnect /P23RSanet/P23RSa[]/soma/spk1longrange  \
	      /P6RSbnet/P6RSb[]/{s}/Ex_ch12P23RSNMDA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1    \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {{longrangeprobscale}*{P23RSa_P6RSb_prob}}

end

// For inhibitory long range connections
////P23RSa - P6RSb GABAa
//str s
////Load synapse location array
//str locations = "apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10"
//
//foreach s ({arglist {locations}})
//
//    barrierall //ayu
//    volumeconnect /P23RSanet/P23RSa[]/soma/spk1longrange  \
//	      /P6RSbnet/P6RSb[]/{s}/Inh_ch12P23RSGABAa@{distantnodes}	    \
//	      -relative			    \
//	      -sourcemask box -1 -1  -1  1  1  1  \
//	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
//	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
//          -probability {{longrangeprobscale}*{P23RSa_P6RSb_prob}}
//
//end


echo Setting weights and delays for P23RSa->P6RSb connections.

// assigning delays
barrierall //ayu
volumedelay /P23RSanet/P23RSa[]/soma/spk1longrange -radial {{P23RSa_P6RSb_axdelayCV}*{longrangeCVscale}} -add

// assigning weights
float P23RSamaxweight = 1.0
float P23RSaminweight = 0.0
float P23RSadecayrate = 0.1
float longrangeweight = {longrangeweightscale}*{{{P23RSamaxweight}-{P23RSaminweight}} * {exp {-1*{sqrt {{NX}^2*{SEPX}^2*{sqrtNnodesperregion}+{NY}^2*{SEPY}^2*{sqrtNnodesperregion}} }*P23RSadecayrate} } + {P23RSaminweight}}
echo P23RSa_P6RSb longrangeweight is {longrangeweight}
barrierall //ayu
volumeweight /P23RSanet/P23RSa[]/soma/spk1longrange -fixed {longrangeweight}

