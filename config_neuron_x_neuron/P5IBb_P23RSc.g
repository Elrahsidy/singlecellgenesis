// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P5IBb_P23RSc_destlim}

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

echo Making connections from the P5IBb cells to the P23RSc cells.

//P5IBb - P23RSc AMPA

str s

//Load synapse location array

str locations = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL"

foreach s ({arglist {locations}})

    rvolumeconnect /P5IBbnet/P5IBb[]/soma/spk7  \
	      /P23RScnet/P23RSc[]/{s}/Ex_ch3P5IBAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
          -probability 0.07692*{P5IBb_P23RSc_prob}

end

//P5IBb - P23RSc NMDA

str s

//Load synapse location array

str locations = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL"

foreach s ({arglist {locations}})

    rvolumeconnect /P5IBbnet/P5IBb[]/soma/spk7  \
	      /P23RScnet/P23RSc[]/{s}/Ex_ch3P5IBNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
          -probability 0.07692*{P5IBb_P23RSc_prob}

end

echo Setting weights and delays for P5IBb->P23RSc connections.
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

rvolumedelay /P5IBbnet/P5IBb[]/soma/spk7 -radial  {P5IBb_P23RSc_axdelayCV} -add -gaussian {P5IBb_P23RSc_axdelaystdev} {P5IBb_P23RSc_axdelaymaxdev}

//P5IBb - P23RSc AMPA

str s

//Load synapse location array

str locations = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL"

foreach s ({arglist {locations}})

    syndelay    /P23RScnet/P23RSc[]/{s}/Ex_ch3P5IBAMPA {P5IBb_P23RSc_syndelay} -add -gaussian {P5IBb_P23RSc_syndelaystdev} {P5IBb_P23RSc_syndelaymaxdev}

end

//P5IBb - P23RSc NMDA

str s

//Load synapse location array

str locations = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL"

foreach s ({arglist {locations}})

    syndelay    /P23RScnet/P23RSc[]/{s}/Ex_ch3P5IBNMDA {P5IBb_P23RSc_syndelay} -add -gaussian {P5IBb_P23RSc_syndelaystdev} {P5IBb_P23RSc_syndelaymaxdev}

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

rvolumeweight /P5IBbnet/P5IBb[]/soma/spk7 -decay {P5IBdecayrate} {P5IBmaxwgt} {P5IBminwgt}




