// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {C5FS_P6RSc_destlim}

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

echo Making connections from the C5FS cells to the P6RSc cells.

// C5FS - P6RSc GABAa

rvolumeconnect /C5FSnet/C5FS[]/soma/spk16  \
	      /P6RScnet/P6RSc[]/axona/Inh_ch13C5FSGABAa@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 1.0*{C5FS_P6RSc_prob}

echo Setting weights and delays for C5FS->P6RSc connections.
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

rvolumedelay /C5FSnet/C5FS[]/soma/spk16 -radial  {C5FS_P6RSc_axdelayCV} -add -gaussian {C5FS_P6RSc_axdelaystdev} {C5FS_P6RSc_axdelaymaxdev}

//C5FS - P6RSc GABAa

syndelay    /P6RScnet/P6RSc[]/axona/Inh_ch13C5FSGABAa {C5FS_P6RSc_syndelay} -add -gaussian {C5FS_P6RSc_syndelaystdev} {C5FS_P6RSc_syndelaymaxdev}

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

rvolumeweight /C5FSnet/C5FS[]/soma/spk16 -decay {C5FSdecayrate} {C5FSmaxwgt} {C5FSminwgt}





