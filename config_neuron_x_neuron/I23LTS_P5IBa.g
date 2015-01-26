// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {I23LTS_P5IBa_destlim}

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

echo Making connections from the I23LTS cells to the P5IBa cells.


//I23LTS - P5IBa GABAa

str s

//Load synapse location array

str locations = "apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12 apdend13 apdend14aR apdend14bR apdend14cR apdend14dR apdend14aL apdend14bL apdend14cL apdend14dL apobdistLb apobdistLc apobmidLb apobmidLc apobproxLb apobproxLc apobdistRb apobdistRc apobmidRb apobmidRc apobproxRb apobproxRc basalLsuperb basalLsuperc basalLmidb basalLmidc basalRsuperb basalRsuperc basalRmidb basalRmidc basaldeepb basaldeepc"

foreach s ({arglist {locations}})

    rvolumeconnect /I23LTSnet/I23LTS[]/soma/spk18  \
	      /P5IBanet/P5IBa[]/{s}/Inh_ch6I23LTSGABAa@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.02500*{I23LTS_P5IBa_prob}

end

echo Setting weights and delays for I23LTS->P5IBa connections.
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

rvolumedelay /I23LTSnet/I23LTS[]/soma/spk18 -radial  {I23LTS_P5IBa_axdelayCV} -add -gaussian {I23LTS_P5IBa_axdelaystdev} {I23LTS_P5IBa_axdelaymaxdev}

//I23LTS - P5IBa GABAa

str s

//Load synapse location array

str locations = "apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12 apdend13 apdend14aR apdend14bR apdend14cR apdend14dR apdend14aL apdend14bL apdend14cL apdend14dL apobdistLb apobdistLc apobmidLb apobmidLc apobproxLb apobproxLc apobdistRb apobdistRc apobmidRb apobmidRc apobproxRb apobproxRc basalLsuperb basalLsuperc basalLmidb basalLmidc basalRsuperb basalRsuperc basalRmidb basalRmidc basaldeepb basaldeepc"

foreach s ({arglist {locations}})

    syndelay    /P5IBanet/P5IBa[]/{s}/Inh_ch6I23LTSGABAa {I23LTS_P5IBa_syndelay} -add -gaussian {I23LTS_P5IBa_syndelaystdev} {I23LTS_P5IBa_syndelaymaxdev}

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

rvolumeweight /I23LTSnet/I23LTS[]/soma/spk18 -decay {I23LTSdecayrate} {I23LTSmaxwgt} {I23LTSminwgt}




