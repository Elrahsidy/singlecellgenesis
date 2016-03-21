// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P23RSc_P6RSb_destlim}

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

echo Making connections from the P23RSc cells to the P6RSb cells.

//P23RSc - P6RSb AMPA

str s

//Load synapse location array

str locations = "apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10"

//str distantnodes = "3" // long range nodes
destlim = 1.0 // being lazy; should calculate based on model size instead

foreach s ({arglist {locations}})

    barrierall //ayu
    rvolumeconnect /P23RScnet/P23RSc[]/soma/spk3longrange  \
	      /P6RSbnet/P6RSb[]/{s}/Ex_ch12P6RSAMPA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {longrangeprobscale}*0.02778*{P23RSc_P6RSb_prob}
          //-probability 0.5

end

//P23RSc - P6RSb NMDA

str s

//Load synapse location array

str locations = "apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10"

foreach s ({arglist {locations}})

    barrierall //ayu
    rvolumeconnect /P23RScnet/P23RSc[]/soma/spk3longrange  \
	      /P6RSbnet/P6RSb[]/{s}/Ex_ch12P6RSNMDA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1    \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {longrangeprobscale}*0.02778*{P23RSc_P6RSb_prob} 

end

echo Setting weights and delays for P23RSc->P6RSb connections.
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
rvolumedelay /P23RScnet/P23RSc[]/soma/spk3longrange -radial  {P23RSc_P6RSb_axdelayCV} -add

// Testing with high weight
float P23RScmaxweight = 1.0
float P23RScminweight = 0.0
float P23RScdecayrate = 0.1
float longrangeweight = {longrangeweightscale}*{{{P23RScmaxweight}-{P23RScminweight}} * {exp {-1*{sqrt {{NX}^2*{SEPX}^2*{sqrtNnodesperregion}+{NY}^2*{SEPY}^2*{sqrtNnodesperregion}} }*P23RScdecayrate} } + {P23RScminweight}}
echo P23RSc_P6RSb longrangeweight is {longrangeweight}
barrierall //ayu
rvolumeweight /P23RScnet/P23RSc[]/soma/spk3longrange -fixed {longrangeweight}




