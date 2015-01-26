// genesis

// LFP Calculation from cellular network,taken at specified point.
// Specifically for P6RSb synaptic currents

echo P6RSb Synaptic Currents - LFP Setup !!!!!!!!!!!!!!!!!!!!!
echo

str s

int k, kmax

kmax = P6RSb_NX*P6RSb_NY-1

//Load synapse location array, P23RS - P6RSb AMPA

str locationsP23RS ="apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23RS}})

          addmsg /P6RSbnet/P6RSb[{k}]/{s}/Ex_ch12P23RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end


//Load synapse location array, P23RS - P6RSb NMDA

str s

//Load synapse location array

str locationsP23RS = "apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23RS}})

          addmsg /P6RSbnet/P6RSb[{k}]/{s}/Ex_ch12P23RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5IB - P6RSb AMPA

str s

//Load synapse location array

str locationsP5IB ="apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apobdistLa apobdistLb apobdistLc apobmidLa apobmidLb apobmidLc apobproxLa apobproxLb apobproxLc apobdistRa apobdistRb apobdistRc apobmidRa apobmidRb apobmidRc apobproxRa apobproxRb apobproxRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc basaldeepa basaldeepb basaldeepc"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5IB}})

          addmsg /P6RSbnet/P6RSb[{k}]/{s}/Ex_ch12P5IBAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5IB - P6RSb NMDA

str s

//Load synapse location array

str locationsP5IB ="apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apobdistLa apobdistLb apobdistLc apobmidLa apobmidLb apobmidLc apobproxLa apobproxLb apobproxLc apobdistRa apobdistRb apobdistRc apobmidRa apobmidRb apobmidRc apobproxRa apobproxRb apobproxRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc basaldeepa basaldeepb basaldeepc"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5IB}})

          addmsg /P6RSbnet/P6RSb[{k}]/{s}/Ex_ch12P5IBNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, B5FS - P6RSb GABAa

str s

//Load synapse location array

str locationsB5FS ="soma apdend1 basalLsupera basalLmida basalRsupera basalRmida basaldeepa"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsB5FS}})

          addmsg /P6RSbnet/P6RSb[{k}]/{s}/Inh_ch12B5FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P6RS - P6RSb AMPA

str s

//Load synapse location array

str locationsP6RS ="apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apobdistLa apobdistLb apobdistLc apobmidLa apobmidLb apobmidLc apobproxLa apobproxLb apobproxLc apobdistRa apobdistRb apobdistRc apobmidRa apobmidRb apobmidRc apobproxRa apobproxRb apobproxRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc basaldeepa basaldeepb basaldeepc"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP6RS}})

          addmsg /P6RSbnet/P6RSb[{k}]/{s}/Ex_ch12P6RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P6RS - P6RSb NMDA

str s

//Load synapse location array

str locationsP6RS ="apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apobdistLa apobdistLb apobdistLc apobmidLa apobmidLb apobmidLc apobproxLa apobproxLb apobproxLc apobdistRa apobdistRb apobdistRc apobmidRa apobmidRb apobmidRc apobproxRa apobproxRb apobproxRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc basaldeepa basaldeepb basaldeepc"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP6RS}})

          addmsg /P6RSbnet/P6RSb[{k}]/{s}/Ex_ch12P6RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, C23FS - P6RSb GABAa

str s

//Load synapse location array

str locationsC23FS = "axona "

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsC23FS}})

          addmsg /P6RSbnet/P6RSb[{k}]/{s}/Inh_ch12C23FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, C5FS - P6RSb GABAa

str s

//Load synapse location array

str locationsC5FS = "axona "

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsC5FS}})

          addmsg /P6RSbnet/P6RSb[{k}]/{s}/Inh_ch12C5FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, ST4RS - P6RSb AMPA

str s

//Load synapse location array

str locationsST4RS = "apdend3 apdend4 apdend5 apdend6 apdend7"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsST4RS}})

          addmsg /P6RSbnet/P6RSb[{k}]/{s}/Ex_ch12ST4RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, ST4RS - P6RSb NMDA

str s

//Load synapse location array

str locationsST4RS = "apdend3 apdend4 apdend5 apdend6 apdend7"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsST4RS}})

          addmsg /P6RSbnet/P6RSb[{k}]/{s}/Ex_ch12ST4RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, I23LTS - P6RSb GABAa

str s

//Load synapse location array

str locationsI23LTS = "apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apobdistLb apobdistLc apobmidLb apobmidLc apobproxLb apobproxLc apobdistRb apobdistRc apobmidRb apobmidRc apobproxRb apobproxRc basalLsuperb basalLsuperc basalLmidb basalLmidc basalRsuperb basalRsuperc basalRmidb basalRmidc basaldeepb basaldeepc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI23LTS}})

          addmsg /P6RSbnet/P6RSb[{k}]/{s}/Inh_ch12I23LTSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, I5LTS - P6RSb GABAa

str s

//Load synapse location array

str locationsI5LTS = "apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apobdistLb apobdistLc apobmidLb apobmidLc apobproxLb apobproxLc apobdistRb apobdistRc apobmidRb apobmidRc apobproxRb apobproxRc basalLsuperb basalLsuperc basalLmidb basalLmidc basalRsuperb basalRsuperc basalRmidb basalRmidc basaldeepb basaldeepc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI5LTS}})

          addmsg /P6RSbnet/P6RSb[{k}]/{s}/Inh_ch12I5LTSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, TCR - P6RSb AMPA

str s

//Load synapse location array

str locationsTCR = "apdend6 apdend7 apdend8 apdend9 apdend10"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsTCR}})

          addmsg /P6RSbnet/P6RSb[{k}]/{s}/Ex_ch12TCRAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, TCR - P6RSb NMDA

str s

//Load synapse location array

str locationsTCR = "apdend6 apdend7 apdend8 apdend9 apdend10"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsTCR}})

          addmsg /P6RSbnet/P6RSb[{k}]/{s}/Ex_ch12TCRNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end
