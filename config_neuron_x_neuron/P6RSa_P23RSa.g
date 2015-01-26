// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P6RSa_P23RSa_destlim}

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

echo Making connections from the P6RSa cells to the P23RSa cells.

//P6RSa - P23RSa AMPA

str s

//Load synapse location array

str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"

foreach s ({arglist {locations}})

    rvolumeconnect /P6RSanet/P6RSa[]/soma/spk11  \
	      /P23RSanet/P23RSa[]/{s}/Ex_ch1P6RSAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1 1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.25000*{P6RSa_P23RSa_prob}

end

//P6RSa - P23RSa NMDA

str s

//Load synapse location array

str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"

foreach s ({arglist {locations}})

    rvolumeconnect /P6RSanet/P6RSa[]/soma/spk11  \
	      /P23RSanet/P23RSa[]/{s}/Ex_ch1P6RSNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.25000*{P6RSa_P23RSa_prob}

end

echo Setting weights and delays for P6RSa->P23RSa connections.
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

rvolumedelay /P6RSanet/P6RSa[]/soma/spk11 -radial  {P6RSa_P23RSa_axdelayCV} -add -gaussian {P6RSa_P23RSa_axdelaystdev} {P6RSa_P23RSa_axdelaymaxdev}

//P6RSa - P23RSa AMPA

str s

//Load synapse location array

str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"

foreach s ({arglist {locations}})

    syndelay    /P23RSanet/P23RSa[]/{s}/Ex_ch1P6RSAMPA {P6RSa_P23RSa_syndelay} -add -gaussian {P6RSa_P23RSa_syndelaystdev} {P6RSa_P23RSa_syndelaymaxdev}

end

//P6RSa - P23RSa NMDA

str s

//Load synapse location array

str locations = "apdend4aL apdend4bL apdend4aR apdend4bR"

foreach s ({arglist {locations}})

    syndelay    /P23RSanet/P23RSa[]/{s}/Ex_ch1P6RSNMDA {P6RSa_P23RSa_syndelay} -add -gaussian {P6RSa_P23RSa_syndelaystdev} {P6RSa_P23RSa_syndelaymaxdev}

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

rvolumeweight /P6RSanet/P6RSa[]/soma/spk11 -decay {P6RSdecayrate} {P6RSmaxwgt} {P6RSminwgt}




