// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P6RSd_P23RSa_destlim}

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

echo Making connections from the P6RSd cells to the P23RSa cells.

//P6RSd - P23RSa AMPA

str s

//Load synapse location array

str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"

//str distantnodes = "3" // long range nodes
destlim = 1.0 // being lazy; should calculate based on model size instead

foreach s ({arglist {locations}})

    barrierall //ayu
    rvolumeconnect /P6RSdnet/P6RSd[]/soma/spk14longrange  \
	      /P23RSanet/P23RSa[]/{s}/Ex_ch1P23RSAMPA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {longrangeprobscale}*{P6RSd_P23RSa_prob}
          //-probability 0.5

end

//P6RSd - P23RSa NMDA

str s

//Load synapse location array

str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"

foreach s ({arglist {locations}})

    barrierall //ayu
    rvolumeconnect /P6RSdnet/P6RSd[]/soma/spk14longrange  \
	      /P23RSanet/P23RSa[]/{s}/Ex_ch1P23RSNMDA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1    \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {longrangeprobscale}*{P6RSd_P23RSa_prob}

end

echo Setting weights and delays for P6RSd->P23RSa connections.
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
rvolumedelay /P6RSdnet/P6RSd[]/soma/spk14longrange -radial  {P6RSd_P23RSa_axdelayCV} -add

// Testing with high weight
float P6RSdmaxweight = 1.0
float P6RSdminweight = 0.0
float P6RSddecayrate = 0.1
float longrangeweight = {longrangeweightscale}*{{{P6RSdmaxweight}-{P6RSdminweight}} * {exp {-1*{sqrt {{NX}^2*{SEPX}^2*{sqrtNnodesperregion}+{NY}^2*{SEPY}^2*{sqrtNnodesperregion}} }*P6RSddecayrate} } + {P6RSdminweight}}
echo P6RSd_P23RSa longrangeweight is {longrangeweight}
barrierall //ayu
rvolumeweight /P6RSdnet/P6RSd[]/soma/spk14longrange -fixed {longrangeweight}




