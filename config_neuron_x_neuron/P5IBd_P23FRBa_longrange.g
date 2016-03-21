// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P5IBd_P23FRBa_destlim}

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

echo Making connections from the P5IBd cells to the P23FRBa cells.

//P5IBd - P23FRBa AMPA

str s

//Load synapse location array

str locations = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL"

//str distantnodes = "3" // long range nodes
destlim = 1.0 // being lazy; should calculate based on model size instead

foreach s ({arglist {locations}})

    barrierall //ayu
    rvolumeconnect /P5IBdnet/P5IBd[]/soma/spk9longrange  \
	      /P23FRBanet/P23FRBa[]/{s}/Ex_ch22P23FRBAMPA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {longrangeprobscale}*{P5IBd_P23FRBa_prob}
          //-probability 0.5

end

//P5IBd - P23FRBa NMDA

str s

//Load synapse location array

str locations = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL"

foreach s ({arglist {locations}})

    barrierall //ayu
    rvolumeconnect /P5IBdnet/P5IBd[]/soma/spk9longrange  \
	      /P23FRBanet/P23FRBa[]/{s}/Ex_ch22P23FRBNMDA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1    \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {longrangeprobscale}*{P5IBd_P23FRBa_prob}

end

echo Setting weights and delays for P5IBd->P23FRBa connections.
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
rvolumedelay /P5IBdnet/P5IBd[]/soma/spk9longrange -radial  {P5IBd_P23FRBa_axdelayCV} -add

// Testing with high weight
float P5IBdmaxweight = 1.0
float P5IBdminweight = 0.0
float P5IBddecayrate = 0.1
float longrangeweight = {longrangeweightscale}*{{{P5IBdmaxweight}-{P5IBdminweight}} * {exp {-1*{sqrt {{NX}^2*{SEPX}^2*{sqrtNnodesperregion}+{NY}^2*{SEPY}^2*{sqrtNnodesperregion}} }*P5IBddecayrate} } + {P5IBdminweight}}
echo P5IBd_P23FRBa longrangeweight is {longrangeweight}
barrierall //ayu
rvolumeweight /P5IBdnet/P5IBd[]/soma/spk9longrange -fixed {longrangeweight}




