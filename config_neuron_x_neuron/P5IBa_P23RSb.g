// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P5IBa_P23RSb_destlim}

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

echo Making connections from the P5IBa cells to the P23RSb cells.

//P5IBa - P23RSb AMPA

str s

//Load synapse location array

str locations = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL"

foreach s ({arglist {locations}})

    rvolumeconnect /P5IBanet/P5IBa[]/soma/spk6  \
	      /P23RSbnet/P23RSb[]/{s}/Ex_ch2P5IBAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
          -probability 0.07692*{P5IBa_P23RSb_prob}

end

//P5IBa - P23RSb NMDA

str s

//Load synapse location array

str locations = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL"

foreach s ({arglist {locations}})

    rvolumeconnect /P5IBanet/P5IBa[]/soma/spk6  \
	      /P23RSbnet/P23RSb[]/{s}/Ex_ch2P5IBNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
          -probability 0.07692*{P5IBa_P23RSb_prob}

end

echo Setting weights and delays for P5IBa->P23RSb connections.
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

rvolumedelay /P5IBanet/P5IBa[]/soma/spk6 -radial  {P5IBa_P23RSb_axdelayCV} -add -gaussian {P5IBa_P23RSb_axdelaystdev} {P5IBa_P23RSb_axdelaymaxdev}

//P5IBa - P23RSb AMPA

str s

//Load synapse location array

str locations = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL"

foreach s ({arglist {locations}})

    syndelay    /P23RSbnet/P23RSb[]/{s}/Ex_ch2P5IBAMPA {P5IBa_P23RSb_syndelay} -add -gaussian {P5IBa_P23RSb_syndelaystdev} {P5IBa_P23RSb_syndelaymaxdev}

end

//P5IBa - P23RSb NMDA

str s

//Load synapse location array

str locations = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL"

foreach s ({arglist {locations}})

    syndelay    /P23RSbnet/P23RSb[]/{s}/Ex_ch2P5IBNMDA {P5IBa_P23RSb_syndelay} -add -gaussian {P5IBa_P23RSb_syndelaystdev} {P5IBa_P23RSb_syndelaymaxdev}

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

rvolumeweight /P5IBanet/P5IBa[]/soma/spk6 -decay {P5IBdecayrate} {P5IBmaxwgt} {P5IBminwgt}




