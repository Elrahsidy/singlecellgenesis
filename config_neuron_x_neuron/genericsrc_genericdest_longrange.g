// genesis

// ayu: I clone this file by doing this:
//grep "^[P]" ../neuron_type_list.txt | while read srcneuron srcspknum; do grep "^[BCIP]" ../neuron_type_list.txt | while read destneuron destspknum; do echo SRC=$srcneuron DEST=$destneuron; locations="`grep 'str locations' ${srcneuron}_${destneuron}.g | head -n1 | sed 's/.* = .//; s/.$//'`"; shortdest="`echo $destneuron | sed 's/[abcd]$//'`"; sed "s/%SRC%/$srcneuron/g; s/%DEST%/$destneuron/g; s/%SRCNUM%/$srcspknum/g; s/%DESTNUM%/$destspknum/g; s/%SHORTDEST%/$shortdest/g; s/str locations.*/str locations = \"$locations\"/" genericsrc_genericdest_longrange.g > new/${srcneuron}_${destneuron}_longrange.g; done; done

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

//float destlim = {%SRC%_%DEST%_destlim}
float destlim = destlim = 1.0 // being lazy; should calculate based on model size instead

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

echo Making connections from the %SRC% cells to the %DEST% cells.

//%SRC% - %DEST% AMPA
str s
//Load synapse location array
str locations = "apobproxLa apobproxLb apobproxLc apobdistLa apobdistLb apobdistLc apobproxRa apobproxRb apobproxRc apobdistRa apobdistRb apobdistRc basalLsupera basalLsuperb basalLsuperc basalLmidsupera basalLmidsuperb basalLmidsuperc basalLmiddeepa basalLmiddeepb basalLmiddeepc basalLdeepa basalLdeepb basalLdeepc basalRsupera basalRsuperb basalRsuperc basalRmidsupera basalRmidsuperb basalRmidsuperc basalRmiddeepa basalRmiddeepb basalRmiddeepc basalRdeepa basalRdeepb basalRdeepc"

foreach s ({arglist {locations}})

    barrierall //ayu
    rvolumeconnect /%SRC%net/%SRC%[]/soma/spk%SRCNUM%longrange  \
	      /%DEST%net/%DEST%[]/{s}/Ex_ch%DESTNUM%%SHORTDEST%AMPA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {longrangeprobscale}*0.02778*{%SRC%_%DEST%_prob}
          //-probability 0.5

end

//%SRC% - %DEST% NMDA
str s
//Load synapse location array
str locations = "apobproxLa apobproxLb apobproxLc apobdistLa apobdistLb apobdistLc apobproxRa apobproxRb apobproxRc apobdistRa apobdistRb apobdistRc basalLsupera basalLsuperb basalLsuperc basalLmidsupera basalLmidsuperb basalLmidsuperc basalLmiddeepa basalLmiddeepb basalLmiddeepc basalLdeepa basalLdeepb basalLdeepc basalRsupera basalRsuperb basalRsuperc basalRmidsupera basalRmidsuperb basalRmidsuperc basalRmiddeepa basalRmiddeepb basalRmiddeepc basalRdeepa basalRdeepb basalRdeepc"

foreach s ({arglist {locations}})

    barrierall //ayu
    rvolumeconnect /%SRC%net/%SRC%[]/soma/spk%SRCNUM%longrange  \
	      /%DEST%net/%DEST%[]/{s}/Ex_ch%DESTNUM%%SHORTDEST%NMDA@{distantnodes}	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1    \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability {longrangeprobscale}*0.02778*{%SRC%_%DEST%_prob} 

end

echo Setting weights and delays for %SRC%->%DEST% connections.

// assigning delays
barrierall //ayu
rvolumedelay /%SRC%net/%SRC%[]/soma/spk%SRCNUM%longrange -radial  {%SRC%_%DEST%_axdelayCV} -add

// assigning weights
float %SRC%maxweight = 1.0
float %SRC%minweight = 0.0
float %SRC%decayrate = 0.1
float longrangeweight = {longrangeweightscale}*{{{%SRC%maxweight}-{%SRC%minweight}} * {exp {-1*{sqrt {{NX}^2*{SEPX}^2*{sqrtNnodesperregion}+{NY}^2*{SEPY}^2*{sqrtNnodesperregion}} }*%SRC%decayrate} } + {%SRC%minweight}}
echo %SRC%_%DEST% longrangeweight is {longrangeweight}
barrierall //ayu
rvolumeweight /%SRC%net/%SRC%[]/soma/spk%SRCNUM%longrange -fixed {longrangeweight}

