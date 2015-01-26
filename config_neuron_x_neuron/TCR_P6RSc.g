// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {TCR_P6RSc_destlim}

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

echo Making connections from the TCR cells to the P6RSc cells.

//TCR - P6RSc AMPA

str s

//Load synapse location array

str locations = "apdend6 apdend7 apdend8 apdend9 apdend10"

foreach s ({arglist {locations}})

    rvolumeconnect /TCRnet/TCR[]/soma/spk20  \
	      /P6RScnet/P6RSc[]/{s}/Ex_ch13TCRAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.20000*{TCR_P6RSc_prob}

end

//TCR - P6RSc NMDA

str s

//Load synapse location array

str locations = "apdend6 apdend7 apdend8 apdend9 apdend10"

foreach s ({arglist {locations}})

    rvolumeconnect /TCRnet/TCR[]/soma/spk20  \
	      /P6RScnet/P6RSc[]/{s}/Ex_ch13TCRNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.20000*{TCR_P6RSc_prob}

end

echo Setting weights and delays for TCR->P6RSc connections.
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

rvolumedelay /TCRnet/TCR[]/soma/spk20 -fixed  {TCR_P6RSc_axdelayCV} -add -gaussian {TCR_P6RSc_axdelaystdev} {TCR_P6RSc_axdelaymaxdev}

//TCR - P6RSc NMDA

str s

//Load synapse location array

str locations = "apdend6 apdend7 apdend8 apdend9 apdend10"

foreach s ({arglist {locations}})

    syndelay    /P6RScnet/P6RSc[]/{s}/Ex_ch13TCRAMPA {TCR_P6RSc_syndelay} -add -gaussian {TCR_P6RSc_syndelaystdev} {TCR_P6RSc_syndelaymaxdev}

end

//TCR - P6RSc NMDA

str s

//Load synapse location array

str locations = "apdend6 apdend7 apdend8 apdend9 apdend10"

foreach s ({arglist {locations}})

    syndelay    /P6RScnet/P6RSc[]/{s}/Ex_ch13TCRNMDA {TCR_P6RSc_syndelay} -add -gaussian {TCR_P6RSc_syndelaystdev} {TCR_P6RSc_syndelaymaxdev}

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




