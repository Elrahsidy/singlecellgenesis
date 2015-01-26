// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {ST4RS_P5IBb_destlim}

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

echo Making connections from the ST4RS cells to the P5IBb cells.


//ST4RS - P5IBb AMPA

str s

//Load synapse location array

str locations = "apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apobdistLa apobmidLa apobproxLa apobdistRa apobmidRa apobproxRa"

foreach s ({arglist {locations}})

    rvolumeconnect /ST4RSnet/ST4RS[]/soma/spk17  \
	      /P5IBbnet/P5IBb[]/{s}/Ex_ch7ST4RSAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.08333*{ST4RS_P5IBb_prob}

end

//ST4RS - P5IBb NMDA

str s

//Load synapse location array

str locations = "apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apobdistLa apobmidLa apobproxLa apobdistRa apobmidRa apobproxRa"

foreach s ({arglist {locations}})

    rvolumeconnect /ST4RSnet/ST4RS[]/soma/spk17  \
	      /P5IBbnet/P5IBb[]/{s}/Ex_ch7ST4RSNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.08333*{ST4RS_P5IBb_prob}

end

echo Setting weights and delays for ST4RS->P5IBb connections.

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

rvolumedelay /ST4RSnet/ST4RS[]/soma/spk17 -radial  {ST4RS_P5IBb_axdelayCV} -add -gaussian {ST4RS_P5IBb_axdelaystdev} {ST4RS_P5IBb_axdelaymaxdev}

//ST4RS - P5IBb AMPA

str s

//Load synapse location array

str locations = "apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apobdistLa apobmidLa apobproxLa apobdistRa apobmidRa apobproxRa"

foreach s ({arglist {locations}})

    syndelay    /P5IBbnet/P5IBb[]/{s}/Ex_ch7ST4RSAMPA {ST4RS_P5IBb_syndelay} -add -gaussian {ST4RS_P5IBb_syndelaystdev} {ST4RS_P5IBb_syndelaymaxdev}

end

//ST4RS - P5IBb NMDA

str s

//Load synapse location array

str locations = "apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apobdistLa apobmidLa apobproxLa apobdistRa apobmidRa apobproxRa"

foreach s ({arglist {locations}})

    syndelay    /P5IBbnet/P5IBb[]/{s}/Ex_ch7ST4RSNMDA {ST4RS_P5IBb_syndelay} -add -gaussian {ST4RS_P5IBb_syndelaystdev} {ST4RS_P5IBb_syndelaymaxdev}

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

rvolumeweight /ST4RSnet/ST4RS[]/soma/spk17 -decay {ST4RSdecayrate} {ST4RSmaxwgt} {ST4RSminwgt}




