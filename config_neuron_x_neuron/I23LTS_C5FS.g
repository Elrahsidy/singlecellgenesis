// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {I23LTS_C5FS_destlim}

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

echo Making connections from the I23LTS cells to the C5FS cells.

//I23LTS - C5FS GABAa

str s

//Load synapse location array

str locations = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

foreach s ({arglist {locations}})

    rvolumeconnect /I23LTSnet/I23LTS[]/soma/spk18  \
	      /C5FSnet/C5FS[]/{s}/Inh_ch16I23LTSGABAa@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.04200*{I23LTS_C5FS_prob}

end

echo Setting weights and delays for I23LTS->C5FS connections.
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

rvolumedelay /I23LTSnet/I23LTS[]/soma/spk18 -radial  {I23LTS_C5FS_axdelayCV} -add -gaussian {I23LTS_C5FS_axdelaystdev} {I23LTS_C5FS_axdelaymaxdev}

//I23LTS - C5FS GABAa

str s

//Load synapse location array

str locations = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

foreach s ({arglist {locations}})

    syndelay    /C5FSnet/C5FS[]/{s}/Inh_ch16I23LTSGABAa {I23LTS_C5FS_syndelay} -add -gaussian {I23LTS_C5FS_syndelaystdev} {I23LTS_C5FS_syndelaymaxdev}

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

rvolumeweight /I23LTSnet/I23LTS[]/soma/spk18 -decay {I23LTSdecayrate} {I23LTSmaxwgt} {I23LTSminwgt}




