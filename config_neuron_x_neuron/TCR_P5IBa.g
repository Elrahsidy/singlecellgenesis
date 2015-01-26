// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {TCR_P5IBa_destlim}

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

echo Making connections from the TCR cells to the P5IBa cells.

//TCR - P5IBa AMPA

str s

//Load synapse location array

str locations = "apdend13 apdend14aR apdend14bR apdend14cR apdend14dR apdend14aL apdend14bL apdend14cL apdend14dL"

foreach s ({arglist {locations}})

    rvolumeconnect /TCRnet/TCR[]/soma/spk20  \
	      /P5IBanet/P5IBa[]/{s}/Ex_ch6TCRAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.11111*{TCR_P5IBa_prob}

end

//TCR - P5IBa NMDA

str s

//Load synapse location array

str locations = "apdend13 apdend14aR apdend14bR apdend14cR apdend14dR apdend14aL apdend14bL apdend14cL apdend14dL"

foreach s ({arglist {locations}})

    rvolumeconnect /TCRnet/TCR[]/soma/spk20  \
	      /P5IBanet/P5IBa[]/{s}/Ex_ch6TCRNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.11111*{TCR_P5IBa_prob}

end

echo Setting weights and delays for TCR->P5IBa connections.
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

rvolumedelay /TCRnet/TCR[]/soma/spk20 -fixed  {TCR_P5IBa_axdelayCV} -add -gaussian {TCR_P5IBa_axdelaystdev} {TCR_P5IBa_axdelaymaxdev}

//TCR - P5IBa NMDA

str s

//Load synapse location array

str locations = "apdend13 apdend14aR apdend14bR apdend14cR apdend14dR apdend14aL apdend14bL apdend14cL apdend14dL"

foreach s ({arglist {locations}})

    syndelay    /P5IBanet/P5IBa[]/{s}/Ex_ch6TCRNMDA {TCR_P5IBa_syndelay} -add -gaussian {TCR_P5IBa_syndelaystdev} {TCR_P5IBa_syndelaymaxdev}

end

//TCR - P5IBa NMDA

str s

//Load synapse location array

str locations = "apdend13 apdend14aR apdend14bR apdend14cR apdend14dR apdend14aL apdend14bL apdend14cL apdend14dL"

foreach s ({arglist {locations}})

    syndelay    /P5IBanet/P5IBa[]/{s}/Ex_ch6TCRAMPA {TCR_P5IBa_syndelay} -add -gaussian {TCR_P5IBa_syndelaystdev} {TCR_P5IBa_syndelaymaxdev}

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




