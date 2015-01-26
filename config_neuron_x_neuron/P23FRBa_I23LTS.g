// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P23FRBa_I23LTS_destlim}

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

echo Making connections from the P23FRBa cells to the I23LTS cells.

//P23FRBa - I23LTS AMPA

str s

//Load synapse location array

str locations = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

foreach s ({arglist {locations}})

    rvolumeconnect /P23FRBanet/P23FRBa[]/soma/spk22  \
	      /I23LTSnet/I23LTS[]/{s}/Ex_ch18P23FRBAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.042*{P23FRBa_I23LTS_prob}

end

//P23FRBa - I23LTS NMDA

str s

//Load synapse location array

str locations = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

foreach s ({arglist {locations}})

    rvolumeconnect /P23FRBanet/P23FRBa[]/soma/spk22  \
	      /I23LTSnet/I23LTS[]/{s}/Ex_ch18P23FRBNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.042*{P23FRBa_I23LTS_prob}

end

echo Setting weights and delays for P23FRBa->I23LTS connections.
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

rvolumedelay /P23FRBanet/P23FRBa[]/soma/spk22 -radial  {P23FRBa_I23LTS_axdelayCV} -add -gaussian {P23FRBa_I23LTS_axdelaystdev} {P23FRBa_I23LTS_axdelaymaxdev}

// P23FRBa - I23LTS AMPA

str s

//Load synapse location array

str locations = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

foreach s ({arglist {locations}})

    syndelay    /I23LTSnet/I23LTS[]/{s}/Ex_ch18P23FRBAMPA {P23FRBa_I23LTS_syndelay} -add -gaussian {P23FRBa_I23LTS_syndelaystdev} {P23FRBa_I23LTS_syndelaymaxdev}

end

// P23FRBa - I23LTS NMDA

str s

//Load synapse location array

str locations = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

foreach s ({arglist {locations}})

    syndelay    /I23LTSnet/I23LTS[]/{s}/Ex_ch18P23FRBNMDA {P23FRBa_I23LTS_syndelay} -add -gaussian {P23FRBa_I23LTS_syndelaystdev} {P23FRBa_I23LTS_syndelaymaxdev}

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
//planarweight /P23FRBanet/P23FRBa[]/soma/spk22 -fixed 0.50



