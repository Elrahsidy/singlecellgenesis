// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {TCR_P5RSa_destlim}

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

echo Making connections from the TCR cells to the P5RSa cells.

//TCR - P5RSa AMPA

str s

//Load synapse location array

str locations = "apdend13 apdend14aR apdend14bR apdend14cR apdend14dR apdend14aL apdend14bL apdend14cL apdend14dL"

foreach s ({arglist {locations}})

    rvolumeconnect /TCRnet/TCR[]/soma/spk20  \
	      /P5RSanet/P5RSa[]/{s}/Ex_ch23TCRAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.11111*{TCR_P5RSa_prob}

end

//TCR - P5RSa NMDA

str s

//Load synapse location array

str locations = "apdend13 apdend14aR apdend14bR apdend14cR apdend14dR apdend14aL apdend14bL apdend14cL apdend14dL"

foreach s ({arglist {locations}})

    rvolumeconnect /TCRnet/TCR[]/soma/spk20  \
	      /P5RSanet/P5RSa[]/{s}/Ex_ch23TCRNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.11111*{TCR_P5RSa_prob}

end

echo Setting weights and delays for TCR->P5RSa connections.
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

rvolumedelay /TCRnet/TCR[]/soma/spk20 -fixed  {TCR_P5RSa_axdelayCV} -add -gaussian {TCR_P5RSa_axdelaystdev} {TCR_P5RSa_axdelaymaxdev}

//TCR - P5RSa NMDA

str s

//Load synapse location array

str locations = "apdend13 apdend14aR apdend14bR apdend14cR apdend14dR apdend14aL apdend14bL apdend14cL apdend14dL"

foreach s ({arglist {locations}})

    syndelay    /P5RSanet/P5RSa[]/{s}/Ex_ch23TCRNMDA {TCR_P5RSa_syndelay} -add -gaussian {TCR_P5RSa_syndelaystdev} {TCR_P5RSa_syndelaymaxdev}

end

//TCR - P5RSa NMDA

str s

//Load synapse location array

str locations = "apdend13 apdend14aR apdend14bR apdend14cR apdend14dR apdend14aL apdend14bL apdend14cL apdend14dL"

foreach s ({arglist {locations}})

    syndelay    /P5RSanet/P5RSa[]/{s}/Ex_ch23TCRAMPA {TCR_P5RSa_syndelay} -add -gaussian {TCR_P5RSa_syndelaystdev} {TCR_P5RSa_syndelaymaxdev}

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




