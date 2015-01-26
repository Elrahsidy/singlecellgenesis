// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {I5LTS_P6RSb_destlim}

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

echo Making connections from the I5LTS cells to the P6RSb cells.


//I5LTS - P6RSb GABAa

str s

//Load synapse location array

str locations = "apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apobdistLb apobdistLc apobmidLb apobmidLc apobproxLb apobproxLc apobdistRb apobdistRc apobmidRb apobmidRc apobproxRb apobproxRc basalLsuperb basalLsuperc basalLmidb basalLmidc basalRsuperb basalRsuperc basalRmidb basalRmidc basaldeepb basaldeepc"

foreach s ({arglist {locations}})

    rvolumeconnect /I5LTSnet/I5LTS[]/soma/spk19  \
	      /P6RSbnet/P6RSb[]/{s}/Inh_ch12I5LTSGABAa@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.03448*{I5LTS_P6RSb_prob}

end

echo Setting weights and delays for I5LTS->P6RSb connections.
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

rvolumedelay /I5LTSnet/I5LTS[]/soma/spk19 -radial  {I5LTS_P6RSb_axdelayCV} -add -gaussian {I5LTS_P6RSb_axdelaystdev} {I5LTS_P6RSb_axdelaymaxdev}

//I5LTS - P6RSb GABAa

str s

//Load synapse location array

str locations = "apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apobdistLb apobdistLc apobmidLb apobmidLc apobproxLb apobproxLc apobdistRb apobdistRc apobmidRb apobmidRc apobproxRb apobproxRc basalLsuperb basalLsuperc basalLmidb basalLmidc basalRsuperb basalRsuperc basalRmidb basalRmidc basaldeepb basaldeepc"

foreach s ({arglist {locations}})

    syndelay    /P6RSbnet/P6RSb[]/{s}/Inh_ch12I5LTSGABAa {I5LTS_P6RSb_syndelay} -add -gaussian {I5LTS_P6RSb_syndelaystdev} {I5LTS_P6RSb_syndelaymaxdev}


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

rvolumeweight /I5LTSnet/I5LTS[]/soma/spk19 -decay {I5LTSdecayrate} {I5LTSmaxwgt} {I5LTSminwgt}




