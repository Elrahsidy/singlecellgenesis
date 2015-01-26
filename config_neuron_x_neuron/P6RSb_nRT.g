// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P6RSb_nRT_destlim}

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

echo Making connections from the P6RSb cells to the nRT cells.

//P6RSb - nRT AMPA

str s

//Load synapse location array

str locations = "proxdendN distdendNlonga distdendNmida proxdendE distdendElonga distdendEmida proxdendS distdendSlonga distdendSmida proxdendW distdendWlonga distdendWmida"

foreach s ({arglist {locations}})

    rvolumeconnect /P6RSbnet/P6RSb[]/soma/spk12  \
	      /nRTnet/nRT[]/{s}/Ex_ch21P6RSAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.08333*{P6RSb_nRT_prob}

end

//P6RSb - nRT NMDA

str s

//Load synapse location array

str locations = "proxdendN distdendNlonga distdendNmida proxdendE distdendElonga distdendEmida proxdendS distdendSlonga distdendSmida proxdendW distdendWlonga distdendWmida"

foreach s ({arglist {locations}})

    rvolumeconnect /P6RSbnet/P6RSb[]/soma/spk12  \
	      /nRTnet/nRT[]/{s}/Ex_ch21P6RSNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.08333*{P6RSb_nRT_prob}

end

echo Setting weights and delays for P6RSb->nRT connections.
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

rvolumedelay /P6RSbnet/P6RSb[]/soma/spk12 -radial  {P6RSb_nRT_axdelayCV} -add -gaussian {P6RSb_nRT_axdelaystdev} {P6RSb_nRT_axdelaymaxdev}

// P6RSb - nRT AMPA

str s

//Load synapse location array

str locations = "proxdendN distdendNlonga distdendNmida proxdendE distdendElonga distdendEmida proxdendS distdendSlonga distdendSmida proxdendW distdendWlonga distdendWmida"

foreach s ({arglist {locations}})

    syndelay    /nRTnet/nRT[]/{s}/Ex_ch21P6RSAMPA {P6RSb_nRT_syndelay} -add -gaussian {P6RSb_nRT_syndelaystdev} {P6RSb_nRT_syndelaymaxdev}

end

// P6RSb - nRT NMDA

str s

//Load synapse location array

str locations = "proxdendN distdendNlonga distdendNmida proxdendE distdendElonga distdendEmida proxdendS distdendSlonga distdendSmida proxdendW distdendWlonga distdendWmida"

foreach s ({arglist {locations}})

    syndelay    /nRTnet/nRT[]/{s}/Ex_ch21P6RSNMDA {P6RSb_nRT_syndelay} -add -gaussian {P6RSb_nRT_syndelaystdev} {P6RSb_nRT_syndelaymaxdev}

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

rvolumeweight /P6RSbnet/P6RSb[]/soma/spk12 -decay {P6RSdecayrate} {P6RSmaxwgt} {P6RSminwgt}
//volumeweight /P6RSanet/P6RSa[]/soma/spk11 -fixed 0.50



