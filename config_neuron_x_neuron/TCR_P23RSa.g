// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {TCR_P23RSa_destlim}

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

echo Making connections from the TCR cells to the P23RSa cells.

//TCR - P23RSa AMPA

str s

//Load synapse location array

str locations = "apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRRR apdend5bRRR apdend5cRRR apdend5aRR apdend5bRR apdend5cRR apdend5aRL apdend5bRL apdend5cRL apdend5aRLL apdend5bRLL apdend5cRLL"

foreach s ({arglist {locations}})

    rvolumeconnect /TCRnet/TCR[]/soma/spk20  \
	      /P23RSanet/P23RSa[]/{s}/Ex_ch1TCRAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.04167*{TCR_P23RSa_prob}

end

//TCR - P23RSa NMDA

str s

//Load synapse location array

str locations = "apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRRR apdend5bRRR apdend5cRRR apdend5aRR apdend5bRR apdend5cRR apdend5aRL apdend5bRL apdend5cRL apdend5aRLL apdend5bRLL apdend5cRLL"

foreach s ({arglist {locations}})

    rvolumeconnect /TCRnet/TCR[]/soma/spk20  \
	      /P23RSanet/P23RSa[]/{s}/Ex_ch1TCRNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.04167*{TCR_P23RSa_prob}

end

echo Setting weights and delays for TCR->P23RSa connections.
// assigning delays using the volumedelay function

/* 
 * Usage :
 * volumedelay path 
 * [-fixed delay]
 * [-radial propagation_velocity] 
 * [-uniform range]   (not used here)
 * [-gaussian sd max] (not used here)
 * [-exp mid max]     (not used here)
 * [-absoluterandom]  (not used here)
 */

rvolumedelay /TCRnet/TCR[]/soma/spk20 -fixed  {TCR_P23RSa_axdelayCV} -add -gaussian {TCR_P23RSa_axdelaystdev} {TCR_P23RSa_axdelaymaxdev}

//TCR - P23RSa NMDA

str s

//Load synapse location array

str locations = "apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRRR apdend5bRRR apdend5cRRR apdend5aRR apdend5bRR apdend5cRR apdend5aRL apdend5bRL apdend5cRL apdend5aRLL apdend5bRLL apdend5cRLL"

foreach s ({arglist {locations}})

    syndelay    /P23RSanet/P23RSa[]/{s}/Ex_ch1TCRAMPA {TCR_P23RSa_syndelay} -add -gaussian {TCR_P23RSa_syndelaystdev} {TCR_P23RSa_syndelaymaxdev}

end

//TCR - P23RSa NMDA

str s

//Load synapse location array

str locations = "apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRRR apdend5bRRR apdend5cRRR apdend5aRR apdend5bRR apdend5cRR apdend5aRL apdend5bRL apdend5cRL apdend5aRLL apdend5bRLL apdend5cRLL"

foreach s ({arglist {locations}})

    syndelay    /P23RSanet/P23RSa[]/{s}/Ex_ch1TCRNMDA {TCR_P23RSa_syndelay} -add -gaussian {TCR_P23RSa_syndelaystdev} {TCR_P23RSa_syndelaymaxdev}

end

// assigning weights using the volumeweight function

/* 
 * Usage :
 *  volumeweight sourcepath 
 *          [-fixed weight]
 *          [-decay decay_rate max_weight min_weight]
 *          [-uniform range] 
 *          [-gaussian sd max] 
 *          [-exponential mid max]
 *          [-absoluterandom]
 */

rvolumeweight /TCRnet/TCR[]/soma/spk20 -decay {TCRdecayrate} {TCRmaxwgt} {TCRminwgt}




