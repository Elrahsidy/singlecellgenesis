// genesis

// LFP Calculation from cellular network,taken at specified point.
// Specifically for P23RSd synaptic currents

echo P23RSd Synaptic Currents - LFP Setup !!!!!!!!!!!!!!!!!!!!!
echo

str s

int k, kmax

kmax = P23RSd_NX*P23RSd_NY-1

//Load synapse location array, P23RS - P23RSd AMPA

str locationsP23RS = "apobproxLa apobproxLb apobproxLc apobdistLa apobdistLb apobdistLc apobproxRa apobproxRb apobproxRc apobdistRa apobdistRb apobdistRc basalLsupera basalLsuperb basalLsuperc basalLmidsupera basalLmidsuperb basalLmidsuperc basalLmiddeepa basalLmiddeepb basalLmiddeepc basalLdeepa basalLdeepb basalLdeepc basalRsupera basalRsuperb basalRsuperc basalRmidsupera basalRmidsuperb basalRmidsuperc basalRmiddeepa basalRmiddeepb basalRmiddeepc basalRdeepa basalRdeepb basalRdeepc soma"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23RS}})

          addmsg /P23RSdnet/P23RSd[{k}]/{s}/Ex_ch4P23RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end


//Load synapse location array, P23RS - P23RSd NMDA

str s

//Load synapse location array

str locationsP23RS = "apobproxLa apobproxLb apobproxLc apobdistLa apobdistLb apobdistLc apobproxRa apobproxRb apobproxRc apobdistRa apobdistRb apobdistRc basalLsupera basalLsuperb basalLsuperc basalLmidsupera basalLmidsuperb basalLmidsuperc basalLmiddeepa basalLmiddeepb basalLmiddeepc basalLdeepa basalLdeepb basalLdeepc basalRsupera basalRsuperb basalRsuperc basalRmidsupera basalRmidsuperb basalRmidsuperc basalRmiddeepa basalRmiddeepb basalRmiddeepc basalRdeepa basalRdeepb basalRdeepc soma"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23RS}})

          addmsg /P23RSdnet/P23RSd[{k}]/{s}/Ex_ch4P23RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, B23FS - P23RSd GABAa

str s

//Load synapse location array

str locationsB23FS = "soma basalLsupera basalLmidsupera basalLmiddeepa basalLdeepa basalRsupera basalRmidsupera basalRmiddeepa basalRdeepa apdend1 apdend2"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsB23FS}})

          addmsg /P23RSdnet/P23RSd[{k}]/{s}/Inh_ch4B23FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5IB - P23RSd AMPA

str s

//Load synapse location array

str locationsP5IB = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL "

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5IB}})

          addmsg /P23RSdnet/P23RSd[{k}]/{s}/Ex_ch4P5IBAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5IB - P23RSd NMDA

str s

//Load synapse location array

str locationsP5IB = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL "

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5IB}})

          addmsg /P23RSdnet/P23RSd[{k}]/{s}/Ex_ch4P5IBNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P6RS - P23RSd AMPA

str s

//Load synapse location array

str locationsP6RS = "apdend4aL apdend4bL apdend4aR apdend4bR "

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP6RS}})

          addmsg /P23RSdnet/P23RSd[{k}]/{s}/Ex_ch4P6RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P6RS - P23RSd NMDA

str s

//Load synapse location array

str locationsP6RS = "apdend4aL apdend4bL apdend4aR apdend4bR "


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP6RS}})

          addmsg /P23RSdnet/P23RSd[{k}]/{s}/Ex_ch4P6RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, C23FS - P23RSd GABAa

str s

//Load synapse location array

str locationsC23FS = "axona "

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsC23FS}})

          addmsg /P23RSdnet/P23RSd[{k}]/{s}/Inh_ch4C23FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, C5FS - P23RSd GABAa

str s

//Load synapse location array

str locationsC5FS = "axona "

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsC5FS}})

          addmsg /P23RSdnet/P23RSd[{k}]/{s}/Inh_ch4C5FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, ST4RS - P23RSd AMPA

str s

//Load synapse location array

str locationsST4RS = "basalLsupera basalLsuperb basalLsuperc basalLmidsupera basalLmidsuperb basalLmidsuperc basalLmiddeepa basalLmiddeepb basalLmiddeepc basalLdeepa basalLdeepb basalLdeepc basalRsupera basalRsuperb basalRsuperc basalRmidsupera basalRmidsuperb basalRmidsuperc basalRmiddeepa basalRmiddeepb basalRmiddeepc basalRdeepa basalRdeepb basalRdeepc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsST4RS}})

          addmsg /P23RSdnet/P23RSd[{k}]/{s}/Ex_ch4ST4RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, ST4RS - P23RSd NMDA

str s

//Load synapse location array

str locationsST4RS = "basalLsupera basalLsuperb basalLsuperc basalLmidsupera basalLmidsuperb basalLmidsuperc basalLmiddeepa basalLmiddeepb basalLmiddeepc basalLdeepa basalLdeepb basalLdeepc basalRsupera basalRsuperb basalRsuperc basalRmidsupera basalRmidsuperb basalRmidsuperc basalRmiddeepa basalRmiddeepb basalRmiddeepc basalRdeepa basalRdeepb basalRdeepc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsST4RS}})

          addmsg /P23RSdnet/P23RSd[{k}]/{s}/Ex_ch4ST4RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, I23LTS - P23RSd GABAa

str s

//Load synapse location array

str locationsI23LTS = "basalLsuperb basalLmidsuperb basalLmiddeepb basalLdeepb basalRsuperb basalRmidsuperb basalRmiddeepb basalRdeepb basalLsuperc basalLmidsuperc basalLmiddeepc basalLdeepc basalRsuperc basalRmidsuperc basalRmiddeepc basalRdeepc apdend3 apdend4aR apdend4bR apdend4aL apdend4bL apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRLL apdend5bRLL apdend5cRLL apdend5aRL apdend5bRL apdend5cRL apdend5aRR apdend5bRR apdend5cRR apdend5aRRR apdend5bRRR apdend5cRRR apobdistRb apobdistRc apobproxRb apobproxRc apobdistLb apobdistLc apobproxLb apobproxLc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI23LTS}})

          addmsg /P23RSdnet/P23RSd[{k}]/{s}/Inh_ch4I23LTSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, I5LTS - P23RSd GABAa

str s

//Load synapse location array

str locationsI5LTS = "basalLsuperb basalLmidsuperb basalLmiddeepb basalLdeepb basalRsuperb basalRmidsuperb basalRmiddeepb basalRdeepb basalLsuperc basalLmidsuperc basalLmiddeepc basalLdeepc basalRsuperc basalRmidsuperc basalRmiddeepc basalRdeepc apdend3 apdend4aR apdend4bR apdend4aL apdend4bL apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRLL apdend5bRLL apdend5cRLL apdend5aRL apdend5bRL apdend5cRL apdend5aRR apdend5bRR apdend5cRR apdend5aRRR apdend5bRRR apdend5cRRR apobdistRb apobdistRc apobproxRb apobproxRc apobdistLb apobdistLc apobproxLb apobproxLc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI5LTS}})

          addmsg /P23RSdnet/P23RSd[{k}]/{s}/Inh_ch4I5LTSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, TCR - P23RSd AMPA

str s

//Load synapse location array

str locationsTCR = "apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRLL apdend5bRLL apdend5cRLL apdend5aRL apdend5bRL apdend5cRL apdend5aRR apdend5bRR apdend5cRR apdend5aRRR apdend5bRRR apdend5cRRR"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsTCR}})

          addmsg /P23RSdnet/P23RSd[{k}]/{s}/Ex_ch4TCRAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, TCR - P23RSd NMDA

str s

//Load synapse location array

str locationsTCR = "apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRLL apdend5bRLL apdend5cRLL apdend5aRL apdend5bRL apdend5cRL apdend5aRR apdend5bRR apdend5cRR apdend5aRRR apdend5bRRR apdend5cRRR"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsTCR}})

          addmsg /P23RSdnet/P23RSd[{k}]/{s}/Ex_ch4TCRNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end
