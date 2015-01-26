// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {TCR_B23FS_destlim}

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

echo Making connections from the TCR cells to the B23FS cells.

//TCR - B23FS AMPA

str s

//Load synapse location array

str locations = "proxdendN distdendNlonga distdendNmida proxdendE distdendElonga distdendEmida proxdendS distdendSlonga distdendSmida proxdendW distdendWlonga distdendWmida"

foreach s ({arglist {locations}})

    rvolumeconnect /TCRnet/TCR[]/soma/spk20  \
	      /B23FSnet/B23FS[]/{s}/Ex_ch5TCRAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.08333*{TCR_B23FS_prob}

end

//TCR - B23FS NMDA

str s

//Load synapse location array

str locations = "proxdendN distdendNlonga distdendNmida proxdendE distdendElonga distdendEmida proxdendS distdendSlonga distdendSmida proxdendW distdendWlonga distdendWmida"

foreach s ({arglist {locations}})

    rvolumeconnect /TCRnet/TCR[]/soma/spk20  \
	      /B23FSnet/B23FS[]/{s}/Ex_ch5TCRNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.08333*{TCR_B23FS_prob}

end

echo Setting weights and delays for TCR->B23FS connections.
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

rvolumedelay /TCRnet/TCR[]/soma/spk20 -radial  {TCR_B23FS_axdelayCV} -add -gaussian {TCR_B23FS_axdelaystdev} {TCR_B23FS_axdelaymaxdev}

// TCR - B23FS AMPA

str s

//Load synapse location array

str locations = "proxdendN distdendNlonga distdendNmida proxdendE distdendElonga distdendEmida proxdendS distdendSlonga distdendSmida proxdendW distdendWlonga distdendWmida"

foreach s ({arglist {locations}})

    syndelay    /B23FSnet/B23FS[]/{s}/Ex_ch5TCRAMPA {TCR_B23FS_syndelay} -add -gaussian {TCR_B23FS_syndelaystdev} {TCR_B23FS_syndelaymaxdev}

end

// TCR - B23FS NMDA

str s

//Load synapse location array

str locations = "proxdendN distdendNlonga distdendNmida proxdendE distdendElonga distdendEmida proxdendS distdendSlonga distdendSmida proxdendW distdendWlonga distdendWmida"

foreach s ({arglist {locations}})

    syndelay    /B23FSnet/B23FS[]/{s}/Ex_ch5TCRNMDA {TCR_B23FS_syndelay} -add -gaussian {TCR_B23FS_syndelaystdev} {TCR_B23FS_syndelaymaxdev}

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
