// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P5IBb_ST4RS_destlim}

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

echo Making connections from the P5IBb cells to the ST4RS cells.

//P5IBb - ST4RS AMPA

str s

//Load synapse location array

str locations = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

foreach s ({arglist {locations}})

    barrierall //ayu
    volumeconnect /P5IBbnet/P5IBb[]/soma/spk7  \
	      /ST4RSnet/ST4RS[]/{s}/Ex_ch17P5IBAMPA@{regionnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {{shortrangeprobscale}*{P5IBb_ST4RS_prob}}

end

//P5IBb - ST4RS NMDA

str s

//Load synapse location array

str locations = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

foreach s ({arglist {locations}})

    barrierall //ayu
    volumeconnect /P5IBbnet/P5IBb[]/soma/spk7  \
	      /ST4RSnet/ST4RS[]/{s}/Ex_ch17P5IBNMDA@{regionnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {{shortrangeprobscale}*{P5IBb_ST4RS_prob}}

end

echo Setting weights and delays for P5IBb->ST4RS connections.
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

barrierall //ayu
volumedelay /P5IBbnet/P5IBb[]/soma/spk7 -radial  {P5IBb_ST4RS_axdelayCV} -add

// P5IBb - ST4RS AMPA

str s

//Load synapse location array

str locations = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

foreach s ({arglist {locations}})

    barrierall //ayu
    syndelay    /ST4RSnet/ST4RS[]/{s}/Ex_ch17P5IBAMPA {P5IBb_ST4RS_syndelay} -add

end

// P5IBb - ST4RS NMDA

str s

//Load synapse location array

str locations = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

foreach s ({arglist {locations}})

    barrierall //ayu
    syndelay    /ST4RSnet/ST4RS[]/{s}/Ex_ch17P5IBNMDA {P5IBb_ST4RS_syndelay} -add

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

barrierall //ayu
volumeweight /P5IBbnet/P5IBb[]/soma/spk7 -decay {P5IBdecayrate} {P5IBmaxwgt} {P5IBminwgt}
//volumeweight /P5IBanet/P5IBa[]/soma/spk6 -fixed 0.50



