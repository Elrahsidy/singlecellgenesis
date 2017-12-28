// genesis

// grep "^[P]" ../neuron_type_list.txt | while read srcneuron srcspknum; do grep "^[PIBC]" ../neuron_type_list.txt | while read destneuron destspknum; do echo SRC=$srcneuron DEST=$destneuron; locations="`grep 'str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

//float destlim = {P6RSb_P23FRBa_destlim}
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

echo Making connections from the P6RSb cells to the P23FRBa cells.

//P6RSb - P23FRBa AMPA
str s
//Load synapse location array
str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"

foreach s ({arglist {locations}})

    barrierall //ayu
    volumeconnect /P6RSbnet/P6RSb[]/soma/spk12longrange  \
	      /P23FRBanet/P23FRBa[]/{s}/Ex_ch22P6RSAMPA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {{longrangeprobscale}*{P6RSb_P23FRBa_prob}}
          //-probability 0.5

end

//P6RSb - P23FRBa NMDA
str s
//Load synapse location array
str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"

foreach s ({arglist {locations}})

    barrierall //ayu
    volumeconnect /P6RSbnet/P6RSb[]/soma/spk12longrange  \
	      /P23FRBanet/P23FRBa[]/{s}/Ex_ch22P6RSNMDA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1    \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {{longrangeprobscale}*{P6RSb_P23FRBa_prob}}

end

// For inhibitory long range connections
////P6RSb - P23FRBa GABAa
//str s
////Load synapse location array
//str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"
//
//foreach s ({arglist {locations}})
//
//    barrierall //ayu
//    volumeconnect /P6RSbnet/P6RSb[]/soma/spk12longrange  \
//	      /P23FRBanet/P23FRBa[]/{s}/Inh_ch22P6RSGABAa@{distantnodes}	    \
//	      -relative			    \
//	      -sourcemask box -1 -1  -1  1  1  1  \
//	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
//	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
//          -probability {{longrangeprobscale}*{P6RSb_P23FRBa_prob}}
//
//end


echo Setting weights and delays for P6RSb->P23FRBa connections.

// assigning delays
barrierall //ayu
volumedelay /P6RSbnet/P6RSb[]/soma/spk12longrange -radial {{P6RSb_P23FRBa_axdelayCV}*{longrangeCVscale}} -add

// assigning weights
float P6RSbmaxweight = 1.0
float P6RSbminweight = 0.0
float P6RSbdecayrate = 0.1
float longrangeweight = {longrangeweightscale}*{{{P6RSbmaxweight}-{P6RSbminweight}} * {exp {-1*{sqrt {{NX}^2*{SEPX}^2*{sqrtNnodesperregion}+{NY}^2*{SEPY}^2*{sqrtNnodesperregion}} }*P6RSbdecayrate} } + {P6RSbminweight}}
echo P6RSb_P23FRBa longrangeweight is {longrangeweight}
barrierall //ayu
volumeweight /P6RSbnet/P6RSb[]/soma/spk12longrange -fixed {longrangeweight}

