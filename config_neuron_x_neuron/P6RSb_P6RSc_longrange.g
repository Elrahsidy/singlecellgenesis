// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P6RSb_P6RSc_destlim}

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

echo Making connections from the P6RSb cells to the P6RSc cells.

//P6RSb - P6RSc AMPA

str s

//Load synapse location array

str locations = "apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apobdistLa apobdistLb apobdistLc apobmidLa apobmidLb apobmidLc apobproxLa apobproxLb apobproxLc apobdistRa apobdistRb apobdistRc apobmidRa apobmidRb apobmidRc apobproxRa apobproxRb apobproxRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc basaldeepa basaldeepb basaldeepc"

//str distantnodes = "3" // long range nodes
destlim = 1.0 // being lazy; should calculate based on model size instead

foreach s ({arglist {locations}})

    barrierall //ayu
    rvolumeconnect /P6RSbnet/P6RSb[]/soma/spk12longrange  \
	      /P6RScnet/P6RSc[]/{s}/Ex_ch13P6RSAMPA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {longrangeprobscale}*0.02778*{P6RSb_P6RSc_prob}
          //-probability 0.5

end

//P6RSb - P6RSc NMDA

str s

//Load synapse location array

str locations = "apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apobdistLa apobdistLb apobdistLc apobmidLa apobmidLb apobmidLc apobproxLa apobproxLb apobproxLc apobdistRa apobdistRb apobdistRc apobmidRa apobmidRb apobmidRc apobproxRa apobproxRb apobproxRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc basaldeepa basaldeepb basaldeepc"

foreach s ({arglist {locations}})

    barrierall //ayu
    rvolumeconnect /P6RSbnet/P6RSb[]/soma/spk12longrange  \
	      /P6RScnet/P6RSc[]/{s}/Ex_ch13P6RSNMDA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1    \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {longrangeprobscale}*0.02778*{P6RSb_P6RSc_prob} 

end

echo Setting weights and delays for P6RSb->P6RSc connections.
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
rvolumedelay /P6RSbnet/P6RSb[]/soma/spk12longrange -radial  {P6RSb_P6RSc_axdelayCV} -add

// Testing with high weight
float P6RSbmaxweight = 1.0
float P6RSbminweight = 0.0
float P6RSbdecayrate = 0.1
float longrangeweight = {longrangeweightscale}*{{{P6RSbmaxweight}-{P6RSbminweight}} * {exp {-1*{sqrt {{NX}^2*{SEPX}^2*{sqrtNnodesperregion}+{NY}^2*{SEPY}^2*{sqrtNnodesperregion}} }*P6RSbdecayrate} } + {P6RSbminweight}}
echo P6RSb_P6RSc longrangeweight is {longrangeweight}
barrierall //ayu
rvolumeweight /P6RSbnet/P6RSb[]/soma/spk12longrange -fixed {longrangeweight}



