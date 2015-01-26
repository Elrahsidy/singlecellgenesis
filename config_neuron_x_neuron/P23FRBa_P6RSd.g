// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P23FRBa_P6RSd_destlim}

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

echo Making connections from the P23FRBa cells to the P6RSd cells.


//P23FRBa - P6RSd AMPA

str s

//Load synapse location array

str locations = "apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10"

foreach s ({arglist {locations}})

    rvolumeconnect /P23FRBanet/P23FRBa[]/soma/spk22  \
	      /P6RSdnet/P6RSd[]/{s}/Ex_ch14P23FRBAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.12500*{P23FRBa_P6RSd_prob}

end

//P23FRBa - P6RSd NMDA

str s

//Load synapse location array

str locations = "apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10"

foreach s ({arglist {locations}})

    rvolumeconnect /P23FRBanet/P23FRBa[]/soma/spk22  \
	      /P6RSdnet/P6RSd[]/{s}/Ex_ch14P23FRBNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.12500*{P23FRBa_P6RSd_prob}

end

echo Setting weights and delays for P23FRBa->P6RSd connections.

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

rvolumedelay /P23FRBanet/P23FRBa[]/soma/spk22 -radial  {P23FRBa_P6RSd_axdelayCV} -add -gaussian {P23FRBa_P6RSd_axdelaystdev} {P23FRBa_P6RSd_axdelaymaxdev}

//P23FRBa - P6RSd AMPA

str s

//Load synapse location array

str locations = "apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10"

foreach s ({arglist {locations}})

    syndelay    /P6RSdnet/P6RSd[]/{s}/Ex_ch14P23FRBAMPA {P23FRBa_P6RSd_syndelay} -add -gaussian {P23FRBa_P6RSd_syndelaystdev} {P23FRBa_P6RSd_syndelaymaxdev}

end

//P23FRBa - P6RSd NMDA

str s

//Load synapse location array

str locations = "apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10"

foreach s ({arglist {locations}})

    syndelay    /P6RSdnet/P6RSd[]/{s}/Ex_ch14P23FRBNMDA {P23FRBa_P6RSd_syndelay} -add -gaussian {P23FRBa_P6RSd_syndelaystdev} {P23FRBa_P6RSd_syndelaymaxdev}

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

rvolumeweight /P23FRBanet/P23FRBa[]/soma/spk22 -decay {P23FRBdecayrate} {P23FRBmaxwgt} {P23FRBminwgt}




