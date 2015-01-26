// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {B23FS_P23FRBa_destlim}

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

echo Making connections from the B23FS cells to the P23FRBa cells.

// B23FS - P23FRBa GABAa

str s

//Load synapse location array

str locations = "soma basalLsupera basalLmidsupera basalLmiddeepa basalLdeepa basalRsupera basalRmidsupera basalRmiddeepa basalRdeepa apdend1 apdend2"

foreach s ({arglist {locations}})

    rvolumeconnect /B23FSnet/B23FS[]/soma/spk5  \
	      /P23FRBanet/P23FRBa[]/{s}/Inh_ch22B23FSGABAa@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1  \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
          -probability 0.091*{B23FS_P23FRBa_prob}

end

echo Setting weights and delays for B23FS->P23FRBa connections.
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

rvolumedelay /B23FSnet/B23FS[]/soma/spk5 -radial  {B23FS_P23FRBa_axdelayCV} -add -gaussian {B23FS_P23FRBa_axdelaystdev} {B23FS_P23FRBa_axdelaymaxdev}

//B23FS - P23FRBa GABAa

str locations = "soma basalLsupera basalLmidsupera basalLmiddeepa basalLdeepa basalRsupera basalRmidsupera basalRmiddeepa basalRdeepa apdend1 apdend2"

foreach s ({arglist {locations}})

    syndelay    /P23FRBanet/P23FRBa[]/{s}/Inh_ch22B23FSGABAa {B23FS_P23FRBa_syndelay} -add -gaussian {B23FS_P23FRBa_syndelaystdev} {B23FS_P23FRBa_syndelaymaxdev}

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

rvolumeweight /B23FSnet/B23FS[]/soma/spk5 -decay {B23FSdecayrate} {B23FSmaxwgt} {B23FSminwgt}




