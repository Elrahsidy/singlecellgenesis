// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P23RSb_P5IBa_destlim}

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

echo Making connections from the P23RSb cells to the P5IBa cells.

//P23RSb - P5IBa AMPA

str s

//Load synapse location array

str locations = "apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12"

//str distantnodes = "3" // long range nodes
destlim = 1.0 // being lazy; should calculate based on model size instead

foreach s ({arglist {locations}})

    barrierall //ayu
    rvolumeconnect /P23RSbnet/P23RSb[]/soma/spk2longrange  \
	      /P5IBanet/P5IBa[]/{s}/Ex_ch6P5IBAMPA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {longrangeprobscale}*0.02778*{P23RSb_P5IBa_prob}
          //-probability 0.5

end

//P23RSb - P5IBa NMDA

str s

//Load synapse location array

str locations = "apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12"

foreach s ({arglist {locations}})

    barrierall //ayu
    rvolumeconnect /P23RSbnet/P23RSb[]/soma/spk2longrange  \
	      /P5IBanet/P5IBa[]/{s}/Ex_ch6P5IBNMDA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1    \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {longrangeprobscale}*0.02778*{P23RSb_P5IBa_prob} 

end

echo Setting weights and delays for P23RSb->P5IBa connections.
// assigning delays using the volumedelay function

/* 
 * Usage :
 * volumedelay path 
 * [-fixed {longrangeweightscale}*{delay]}
 * [-radial propagation_velocity] 
 * [-uniform range]   (not used here)
 * [-gaussian sd max] (not used here)
 * [-exp mid max]     (not used here)
 * [-absoluterandom]  (not used here)
 */

barrierall //ayu
rvolumedelay /P23RSbnet/P23RSb[]/soma/spk2longrange -radial  {P23RSb_P5IBa_axdelayCV} -add

// Testing with high weight
float P23RSbmaxweight = 1.0
float P23RSbminweight = 0.0
float P23RSbdecayrate = 0.1
float longrangeweight = {longrangeweightscale}*{{{P23RSbmaxweight}-{P23RSbminweight}} * {exp {-1*{sqrt {{NX}^2*{SEPX}^2*{sqrtNnodesperregion}+{NY}^2*{SEPY}^2*{sqrtNnodesperregion}} }*P23RSbdecayrate} } + {P23RSbminweight}}
echo P23RSb_P5IBa longrangeweight is {longrangeweight}
barrierall //ayu
rvolumeweight /P23RSbnet/P23RSb[]/soma/spk2longrange -fixed {longrangeweight}



