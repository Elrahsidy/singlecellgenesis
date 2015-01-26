// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {B5FS_ST4RS_destlim}

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

echo Making connections from the B5FS cells to the ST4RS cells.

//B5FS - ST4RS GABAa

str s

//Load synapse location array

str locations = "soma proxdendN proxdendE proxdendS proxdendW"

foreach s ({arglist {locations}})

    rvolumeconnect /B5FSnet/B5FS[]/soma/spk10  \
	      /ST4RSnet/ST4RS[]/{s}/Inh_ch17B5FSGABAa@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.200*{B5FS_ST4RS_prob}

end

echo Setting weights and delays for B5FS->ST4RS connections.
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

rvolumedelay /B5FSnet/B5FS[]/soma/spk10 -radial  {B5FS_ST4RS_axdelayCV} -add -gaussian {B5FS_ST4RS_axdelaystdev} {B5FS_ST4RS_axdelaymaxdev}

// B5FS - ST4RS GABAa

str s

//Load synapse location array

str locations = "soma proxdendN proxdendE proxdendS proxdendW"

foreach s ({arglist {locations}})

    syndelay    /ST4RSnet/ST4RS[]/{s}/Inh_ch17B5FSGABAa {B5FS_ST4RS_syndelay} -add -gaussian {B5FS_ST4RS_syndelaystdev} {B5FS_ST4RS_syndelaymaxdev}

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

rvolumeweight /B5FSnet/B5FS[]/soma/spk10 -decay {B5FSdecayrate} {B5FSmaxwgt} {B5FSminwgt}
//volumeweight /B5FSnet/B5FS[]/soma/spk10 -fixed 0.50



