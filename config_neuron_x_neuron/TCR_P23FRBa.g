// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {TCR_P23FRBa_destlim}

/*
 * Usage :
 * planarconnect source-path destination-path
 *		 [-relative]
 *		 [-sourcemask {box,ellipse} x1 y1 x2 y2]
 *		 [-sourcehole {box,ellipse} x1 y1 x2 y2]
 *		 [-destmask   {box,ellipse} x1 y1 x2 y2]
 *		 [-desthole   {box,ellipse} x1 y1 x2 y2]
 *		 [-probability p]
 */

echo Making connections from the TCR cells to the P23FRBa cells.

//TCR - P23FRBa AMPA

str s

//Load synapse location array

str locations = "apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRRR apdend5bRRR apdend5cRRR apdend5aRR apdend5bRR apdend5cRR apdend5aRL apdend5bRL apdend5cRL apdend5aRLL apdend5bRLL apdend5cRLL"

foreach s ({arglist {locations}})

    rvolumeconnect /TCRnet/TCR[]/soma/spk20  \
	      /P23FRBanet/P23FRBa[]/{s}/Ex_ch22TCRAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.04167*{TCR_P23FRBa_prob}

end

//TCR - P23FRBa NMDA

str s

//Load synapse location array

str locations = "apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRRR apdend5bRRR apdend5cRRR apdend5aRR apdend5bRR apdend5cRR apdend5aRL apdend5bRL apdend5cRL apdend5aRLL apdend5bRLL apdend5cRLL"

foreach s ({arglist {locations}})

    rvolumeconnect /TCRnet/TCR[]/soma/spk20  \
	      /P23FRBanet/P23FRBa[]/{s}/Ex_ch22TCRNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.04167*{TCR_P23FRBa_prob}

end

echo Setting weights and delays for TCR->P23FRBa connections.
// assigning delays using the planardelay function

/* 
 * Usage :
 * planardelay path 
 * [-fixed delay]
 * [-radial propagation_velocity] 
 * [-uniform range]   (not used here)
 * [-gaussian sd max] (not used here)
 * [-exp mid max]     (not used here)
 * [-absoluterandom]  (not used here)
 */

rvolumedelay /TCRnet/TCR[]/soma/spk20 -fixed  {TCR_P23FRBa_axdelayCV} -add -gaussian {TCR_P23FRBa_axdelaystdev} {TCR_P23FRBa_axdelaymaxdev}

//TCR - P23FRBa NMDA

str s

//Load synapse location array

str locations = "apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRRR apdend5bRRR apdend5cRRR apdend5aRR apdend5bRR apdend5cRR apdend5aRL apdend5bRL apdend5cRL apdend5aRLL apdend5bRLL apdend5cRLL"

foreach s ({arglist {locations}})

    syndelay    /P23FRBanet/P23FRBa[]/{s}/Ex_ch22TCRAMPA {TCR_P23FRBa_syndelay} -add -gaussian {TCR_P23FRBa_syndelaystdev} {TCR_P23FRBa_syndelaymaxdev}

end

//TCR - P23FRBa NMDA

str s

//Load synapse location array

str locations = "apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRRR apdend5bRRR apdend5cRRR apdend5aRR apdend5bRR apdend5cRR apdend5aRL apdend5bRL apdend5cRL apdend5aRLL apdend5bRLL apdend5cRLL"

foreach s ({arglist {locations}})

    syndelay    /P23FRBanet/P23FRBa[]/{s}/Ex_ch22TCRNMDA {TCR_P23FRBa_syndelay} -add -gaussian {TCR_P23FRBa_syndelaystdev} {TCR_P23FRBa_syndelaymaxdev}

end

// assigning weights using the planarweight function

/* 
 * Usage :
 *  planarweight sourcepath 
 *          [-fixed weight]
 *          [-decay decay_rate max_weight min_weight]
 *          [-uniform range] 
 *          [-gaussian sd max] 
 *          [-exponential mid max]
 *          [-absoluterandom]
 */

rvolumeweight /TCRnet/TCR[]/soma/spk20 -decay {TCRdecayrate} {TCRmaxwgt} {TCRminwgt}




