// genesis

// LFP Calculation from cellular network,taken at specified point.

echo LFP Calculation Setup !!!!!!!!!!!!!!!!!!!!!
echo

// Ion Channel Currents
echo Ion Channel Currents !!!!!!!!!!!!!!!!!!!!
echo

float LFPx = P23RSa_SEPX*P23RSa_NX/2*sqrtNnodes
float LFPy = P23RSa_SEPY*P23RSa_NY/2*sqrtNnodes
float LFPz = 2340e-6

create efield LFPmodcent
create efield LFPsynmodcent

setfield LFPmodcent scale 0.335 x {LFPx} y {LFPy} z {LFPz} 
setfield LFPsynmodcent scale 0.335 x {LFPx} y {LFPy} z {LFPz} 

str s

int k, kmax

//Load compartment location array

echo P23RS LFP !!!!!!!!!!!!!!!!
echo

kmax = P23RSa_NX*P23RSa_NY-1

str locationsP23RS = "soma apdend1 apdend2 apdend3 apdend4aL apdend4bL apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRRR apdend5bRRR apdend5cRRR apdend5aRR apdend5bRR apdend5cRR apdend5aRL apdend5bRL apdend5cRL apdend5aRLL apdend5bRLL apdend5cRLL apobproxLa apobproxLb apobproxLc apobdistLa apobdistLb apobdistLc apobproxRa apobproxRb apobproxRc apobdistRa apobdistRb apobdistRc basalLsupera basalLsuperb basalLsuperc basalLmidsupera basalLmidsuperb basalLmidsuperc basalLmiddeepa basalLmiddeepb basalLmiddeepc basalLdeepa basalLdeepb basalLdeepc basalRsupera basalRsuperb basalRsuperc basalRmidsupera basalRmidsuperb basalRmidsuperc basalRmiddeepa basalRmiddeepb basalRmiddeepc basalRdeepa basalRdeepb basalRdeepc axona axonb axonLa axonLb axonRa axonRb"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23RS}})

          addmsg /P23RSanet/P23RSa[{k}]/{s} LFPmodcent CURRENT Im 0.0
          addmsg /P23RSbnet/P23RSb[{k}]/{s} LFPmodcent CURRENT Im 0.0
          addmsg /P23RScnet/P23RSc[{k}]/{s} LFPmodcent CURRENT Im 0.0
          addmsg /P23RSdnet/P23RSd[{k}]/{s} LFPmodcent CURRENT Im 0.0

     end

end

//Load compartment location array

if ({columntype == 0})

     kmax = B23FS_NX*B23FS_NY-1

end

if ({columntype == 1})

     kmax = {B23FS_NX/2}*B23FS_NY-1

end

echo B23FS LFP !!!!!!!!!!!!!!!!
echo

str locationsB23FS = "soma proxdendN proxdendE proxdendS proxdendW distdendNlonga distdendNlongb distdendNlongc distdendNlongd distdendNlonge distdendNlongf distdendNlongg distdendNmida distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElonga distdendElongb distdendElongc distdendElongd distdendElonge distdendElongf distdendElongg distdendEmida distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlonga distdendSlongb distdendSlongc distdendSlongd distdendSlonge distdendSlongf distdendSlongg distdendSmida distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlonga distdendWlongb distdendWlongc distdendWlongd distdendWlonge distdendWlongf distdendWlongg distdendWmida distdendWmidb distdendWmidc distdendWshorta distdendWshortb axona axonb axonLa axonLb axonRa axonRb"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsB23FS}})

          addmsg /B23FSnet/B23FS[{k}]/{s} LFPmodcent CURRENT Im 0.0

     end

end

//Load compartment location array

kmax = P5IBa_NX*P5IBa_NY-1

echo P5IB LFP !!!!!!!!!!!!!!!!
echo

str locationsP5IB = "soma apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12 apdend13 apdend14aR apdend14bR apdend14cR apdend14dR apdend14aL apdend14bL apdend14cL apdend14dL apobproxLa apobproxLb apobproxLc apobmidLa apobmidLb apobmidLc apobdistLa apobdistLb apobdistLc apobproxRa apobproxRb apobproxRc apobmidRa apobmidRb apobmidRc apobdistRa apobdistRb apobdistRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basaldeepa basaldeepb basaldeepc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc axona axonb axonLa axonLb axonRa axonRb"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5IB}})

          addmsg /P5IBanet/P5IBa[{k}]/{s} LFPmodcent CURRENT Im 0.0
          addmsg /P5IBbnet/P5IBb[{k}]/{s} LFPmodcent CURRENT Im 0.0
          addmsg /P5IBcnet/P5IBc[{k}]/{s} LFPmodcent CURRENT Im 0.0
          addmsg /P5IBdnet/P5IBd[{k}]/{s} LFPmodcent CURRENT Im 0.0

     end

end

//Load compartment location array

if ({columntype == 0})

     kmax = B5FS_NX*B5FS_NY-1

end

if ({columntype == 1})

     kmax = {B5FS_NX/2}*B5FS_NY-1

end

echo B5FS LFP !!!!!!!!!!!!!!!!
echo

str locationsB5FS = "soma proxdendN proxdendE proxdendS proxdendW distdendNlonga distdendNlongb distdendNlongc distdendNlongd distdendNlonge distdendNlongf distdendNlongg distdendNmida distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElonga distdendElongb distdendElongc distdendElongd distdendElonge distdendElongf distdendElongg distdendEmida distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlonga distdendSlongb distdendSlongc distdendSlongd distdendSlonge distdendSlongf distdendSlongg distdendSmida distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlonga distdendWlongb distdendWlongc distdendWlongd distdendWlonge distdendWlongf distdendWlongg distdendWmida distdendWmidb distdendWmidc distdendWshorta distdendWshortb axona axonb axonLa axonLb axonRa axonRb"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsB5FS}})

          addmsg /B5FSnet/B5FS[{k}]/{s} LFPmodcent CURRENT Im 0.0

     end

end

//Load compartment location array

kmax = P6RSa_NX*P6RSa_NY-1

echo P6RS LFP !!!!!!!!!!!!!!!!
echo

str locationsP6RS = "soma apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apobproxLa apobproxLb apobproxLc apobmidLa apobmidLb apobmidLc apobdistLa apobdistLb apobdistLc apobproxRa apobproxRb apobproxRc apobmidRa apobmidRb apobmidRc apobdistRa apobdistRb apobdistRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basaldeepa basaldeepb basaldeepc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc axona axonb axonLa axonLb axonRa axonRb"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP6RS}})

          addmsg /P6RSanet/P6RSa[{k}]/{s} LFPmodcent CURRENT Im 0.0
          addmsg /P6RSbnet/P6RSb[{k}]/{s} LFPmodcent CURRENT Im 0.0

          if ({columntype == 0})

               addmsg /P6RScnet/P6RSc[{k}]/{s} LFPmodcent CURRENT Im 0.0
               addmsg /P6RSdnet/P6RSd[{k}]/{s} LFPmodcent CURRENT Im 0.0
          
          end

     end

end

//Load compartment location array

if ({columntype == 0})

     kmax = C23FS_NX*C23FS_NY-1

end

if ({columntype == 1})

     kmax = {C23FS_NX/2}*C23FS_NY-1

end

echo C23FS LFP !!!!!!!!!!!!!!!!
echo

str locationsC23FS = "soma proxdendN proxdendE proxdendS proxdendW distdendNlonga distdendNlongb distdendNlongc distdendNlongd distdendNlonge distdendNlongf distdendNlongg distdendNmida distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElonga distdendElongb distdendElongc distdendElongd distdendElonge distdendElongf distdendElongg distdendEmida distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlonga distdendSlongb distdendSlongc distdendSlongd distdendSlonge distdendSlongf distdendSlongg distdendSmida distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlonga distdendWlongb distdendWlongc distdendWlongd distdendWlonge distdendWlongf distdendWlongg distdendWmida distdendWmidb distdendWmidc distdendWshorta distdendWshortb axona axonb axonLa axonLb axonRa axonRb"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsC23FS}})

          addmsg /C23FSnet/C23FS[{k}]/{s} LFPmodcent CURRENT Im 0.0

     end

end

//Load compartment location array

if ({columntype == 0})

     kmax = C5FS_NX*C5FS_NY-1

end

if ({columntype == 1})

     kmax = {C5FS_NX/2}*C5FS_NY-1

end

echo C5FS LFP !!!!!!!!!!!!!!!!
echo

str locationsC5FS = "soma proxdendN proxdendE proxdendS proxdendW distdendNlonga distdendNlongb distdendNlongc distdendNlongd distdendNlonge distdendNlongf distdendNlongg distdendNmida distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElonga distdendElongb distdendElongc distdendElongd distdendElonge distdendElongf distdendElongg distdendEmida distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlonga distdendSlongb distdendSlongc distdendSlongd distdendSlonge distdendSlongf distdendSlongg distdendSmida distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlonga distdendWlongb distdendWlongc distdendWlongd distdendWlonge distdendWlongf distdendWlongg distdendWmida distdendWmidb distdendWmidc distdendWshorta distdendWshortb axona axonb axonLa axonLb axonRa axonRb"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsC5FS}})

          addmsg /C5FSnet/C5FS[{k}]/{s} LFPmodcent CURRENT Im 0.0

     end

end

//Load compartment location array

kmax = ST4RS_NX*ST4RS_NY-1

echo ST4RS LFP !!!!!!!!!!!!!!!!
echo

str locationsST4RS = "soma proxdendN proxdendE proxdendS proxdendW distdendNlonga distdendNlongb distdendNlongc distdendNlongd distdendNlonge distdendNlongf distdendNlongg distdendNmida distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElonga distdendElongb distdendElongc distdendElongd distdendElonge distdendElongf distdendElongg distdendEmida distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlonga distdendSlongb distdendSlongc distdendSlongd distdendSlonge distdendSlongf distdendSlongg distdendSmida distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlonga distdendWlongb distdendWlongc distdendWlongd distdendWlonge distdendWlongf distdendWlongg distdendWmida distdendWmidb distdendWmidc distdendWshorta distdendWshortb axona axonb axonLa axonLb axonRa axonRb"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsST4RS}})

          addmsg /ST4RSnet/ST4RS[{k}]/{s} LFPmodcent CURRENT Im 0.0

     end

end

//Load compartment location array

if ({columntype == 0})

     kmax = I23LTS_NX*I23LTS_NY-1

end

if ({columntype == 1})

     kmax = {I23LTS_NX/2}*I23LTS_NY-1

end

echo I23LTS LFP !!!!!!!!!!!!!!!!
echo 

str locationsI23LTS = "soma proxdendN proxdendE proxdendS proxdendW distdendNlonga distdendNlongb distdendNlongc distdendNlongd distdendNlonge distdendNlongf distdendNlongg distdendNmida distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElonga distdendElongb distdendElongc distdendElongd distdendElonge distdendElongf distdendElongg distdendEmida distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlonga distdendSlongb distdendSlongc distdendSlongd distdendSlonge distdendSlongf distdendSlongg distdendSmida distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlonga distdendWlongb distdendWlongc distdendWlongd distdendWlonge distdendWlongf distdendWlongg distdendWmida distdendWmidb distdendWmidc distdendWshorta distdendWshortb axona axonb axonLa axonLb axonRa axonRb"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI23LTS}})

          addmsg /I23LTSnet/I23LTS[{k}]/{s} LFPmodcent CURRENT Im 0.0

     end

end

//Load compartment location array

if ({columntype == 0})

     kmax = I5LTS_NX*I5LTS_NY-1

end

if ({columntype == 1})

     kmax = {I5LTS_NX/2}*I5LTS_NY-1

end

echo I5LTS LFP !!!!!!!!!!!!!!!!
echo

str locationsI5LTS = "soma proxdendN proxdendE proxdendS proxdendW distdendNlonga distdendNlongb distdendNlongc distdendNlongd distdendNlonge distdendNlongf distdendNlongg distdendNmida distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElonga distdendElongb distdendElongc distdendElongd distdendElonge distdendElongf distdendElongg distdendEmida distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlonga distdendSlongb distdendSlongc distdendSlongd distdendSlonge distdendSlongf distdendSlongg distdendSmida distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlonga distdendWlongb distdendWlongc distdendWlongd distdendWlonge distdendWlongf distdendWlongg distdendWmida distdendWmidb distdendWmidc distdendWshorta distdendWshortb axona axonb axonLa axonLb axonRa axonRb"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI5LTS}})

          addmsg /I5LTSnet/I5LTS[{k}]/{s} LFPmodcent CURRENT Im 0.0

     end

end

//Load compartment location array

echo P23FRB LFP !!!!!!!!!!!!!!!!
echo

kmax = P23FRBa_NX*P23FRBa_NY-1

str locationsP23FRB = "soma apdend1 apdend2 apdend3 apdend4aL apdend4bL apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRRR apdend5bRRR apdend5cRRR apdend5aRR apdend5bRR apdend5cRR apdend5aRL apdend5bRL apdend5cRL apdend5aRLL apdend5bRLL apdend5cRLL apobproxLa apobproxLb apobproxLc apobdistLa apobdistLb apobdistLc apobproxRa apobproxRb apobproxRc apobdistRa apobdistRb apobdistRc basalLsupera basalLsuperb basalLsuperc basalLmidsupera basalLmidsuperb basalLmidsuperc basalLmiddeepa basalLmiddeepb basalLmiddeepc basalLdeepa basalLdeepb basalLdeepc basalRsupera basalRsuperb basalRsuperc basalRmidsupera basalRmidsuperb basalRmidsuperc basalRmiddeepa basalRmiddeepb basalRmiddeepc basalRdeepa basalRdeepb basalRdeepc axona axonb axonLa axonLb axonRa axonRb"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23FRB}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s} LFPmodcent CURRENT Im 0.0

     end

end

//Load compartment location array

kmax = P5RSa_NX*P5RSa_NY-1

echo P5RS LFP !!!!!!!!!!!!!!!!
echo

str locationsP5RS = "soma apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12 apdend13 apdend14aR apdend14bR apdend14cR apdend14dR apdend14aL apdend14bL apdend14cL apdend14dL apobproxLa apobproxLb apobproxLc apobmidLa apobmidLb apobmidLc apobdistLa apobdistLb apobdistLc apobproxRa apobproxRb apobproxRc apobmidRa apobmidRb apobmidRc apobdistRa apobdistRb apobdistRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basaldeepa basaldeepb basaldeepc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc axona axonb axonLa axonLb axonRa axonRb"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5RS}})

          addmsg /P5RSanet/P5RSa[{k}]/{s} LFPmodcent CURRENT Im 0.0

     end

end

// Synaptic Currents
echo Synaptic Currents !!!!!!!!!!!!!!!!!!!!
echo

//P23RSasynapseI
//P23RSbsynapseI
//P23RScsynapseI
//P23RSdsynapseI

//B23FSsynapseI

//P5IBasynapseI
//P5IBbsynapseI
//P5IBcsynapseI
//P5IBdsynapseI

//B5FSsynapseI

//P6RSasynapseI
//P6RSbsynapseI

//if ({columntype == 0})

//     P6RScsynapseI
//     P6RSdsynapseI

//end

//C23FSsynapseI
//C5FSsynapseI

//ST4RSsynapseI

//I23LTSsynapseI
//I5LTSsynapseI

//P23FRBasynapseI
//P5RSasynapseI

call LFPmodcent RECALC
//call LFPsynmodcent RECALC



