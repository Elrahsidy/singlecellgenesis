// genesis

// grep "^[P]" ../neuron_type_list.txt | while read srcneuron srcspknum; do grep "^[PIBC]" ../neuron_type_list.txt | while read destneuron destspknum; do echo SRC=$srcneuron DEST=$destneuron; locations="`grep 'str locations = "apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apobdistLa apobdistLb apobdistLc apobmidLa apobmidLb apobmidLc apobproxLa apobproxLb apobproxLc apobdistRa apobdistRb apobdistRc apobmidRa apobmidRb apobmidRc apobproxRa apobproxRb apobproxRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc basaldeepa basaldeepb basaldeepc"

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

//float destlim = {P5IBb_P6RSd_destlim}
float destlim = 1.0 // being lazy; should calculate based on model size instead

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

echo Making connections from the P5IBb cells to the P6RSd cells.

//P5IBb - P6RSd AMPA
str s
//Load synapse location array
str locations = "apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apobdistLa apobdistLb apobdistLc apobmidLa apobmidLb apobmidLc apobproxLa apobproxLb apobproxLc apobdistRa apobdistRb apobdistRc apobmidRa apobmidRb apobmidRc apobproxRa apobproxRb apobproxRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc basaldeepa basaldeepb basaldeepc"

foreach s ({arglist {locations}})

    barrierall //ayu
    rvolumeconnect /P5IBbnet/P5IBb[]/soma/spk7longrange  \
	      /P6RSdnet/P6RSd[]/{s}/Ex_ch14P5IBAMPA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {{longrangeprobscale}*{P5IBb_P6RSd_prob}}
          //-probability 0.5

end

//P5IBb - P6RSd NMDA
str s
//Load synapse location array
str locations = "apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apobdistLa apobdistLb apobdistLc apobmidLa apobmidLb apobmidLc apobproxLa apobproxLb apobproxLc apobdistRa apobdistRb apobdistRc apobmidRa apobmidRb apobmidRc apobproxRa apobproxRb apobproxRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc basaldeepa basaldeepb basaldeepc"

foreach s ({arglist {locations}})

    barrierall //ayu
    rvolumeconnect /P5IBbnet/P5IBb[]/soma/spk7longrange  \
	      /P6RSdnet/P6RSd[]/{s}/Ex_ch14P5IBNMDA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1    \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {{longrangeprobscale}*{P5IBb_P6RSd_prob}}

end

// For inhibitory long range connections
////P5IBb - P6RSd GABAa
//str s
////Load synapse location array
//str locations = "apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apobdistLa apobdistLb apobdistLc apobmidLa apobmidLb apobmidLc apobproxLa apobproxLb apobproxLc apobdistRa apobdistRb apobdistRc apobmidRa apobmidRb apobmidRc apobproxRa apobproxRb apobproxRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc basaldeepa basaldeepb basaldeepc"
//
//foreach s ({arglist {locations}})
//
//    barrierall //ayu
//    rvolumeconnect /P5IBbnet/P5IBb[]/soma/spk7longrange  \
//	      /P6RSdnet/P6RSd[]/{s}/Inh_ch14P5IBGABAa@{distantnodes}	    \
//	      -relative			    \
//	      -sourcemask box -1 -1  -1  1  1  1  \
//	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
//	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
//          -probability {{longrangeprobscale}*{P5IBb_P6RSd_prob}}
//
//end


echo Setting weights and delays for P5IBb->P6RSd connections.

// assigning delays
barrierall //ayu
rvolumedelay /P5IBbnet/P5IBb[]/soma/spk7longrange -radial {{P5IBb_P6RSd_axdelayCV}*{longrangeCVscale}} -add

// assigning weights
float P5IBbmaxweight = 1.0
float P5IBbminweight = 0.0
float P5IBbdecayrate = 0.1
float longrangeweight = {longrangeweightscale}*{{{P5IBbmaxweight}-{P5IBbminweight}} * {exp {-1*{sqrt {{NX}^2*{SEPX}^2*{sqrtNnodesperregion}+{NY}^2*{SEPY}^2*{sqrtNnodesperregion}} }*P5IBbdecayrate} } + {P5IBbminweight}}
echo P5IBb_P6RSd longrangeweight is {longrangeweight}
barrierall //ayu
rvolumeweight /P5IBbnet/P5IBb[]/soma/spk7longrange -fixed {longrangeweight}

