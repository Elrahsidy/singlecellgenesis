// genesis

// LFP Calculation from cellular network,taken at specified point.
// Specifically for P23FRBa synaptic currents

echo P23FRBa Synaptic Currents - LFP Setup !!!!!!!!!!!!!!!!!!!!!
echo

str s

int k, kmax

kmax = P23FRBa_NX*P23FRBa_NY-1

//Load synapse location array, P23RS - P23FRBa AMPA

str locationsP23RS = "apobproxLa apobproxLb apobproxLc apobdistLa apobdistLb apobdistLc apobproxRa apobproxRb apobproxRc apobdistRa apobdistRb apobdistRc basalLsupera basalLsuperb basalLsuperc basalLmidsupera basalLmidsuperb basalLmidsuperc basalLmiddeepa basalLmiddeepb basalLmiddeepc basalLdeepa basalLdeepb basalLdeepc basalRsupera basalRsuperb basalRsuperc basalRmidsupera basalRmidsuperb basalRmidsuperc basalRmiddeepa basalRmiddeepb basalRmiddeepc basalRdeepa basalRdeepb basalRdeepc soma"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23RS}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Ex_ch22P23RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P23RS - P23FRBa NMDA

str locationsP23RS = "apobproxLa apobproxLb apobproxLc apobdistLa apobdistLb apobdistLc apobproxRa apobproxRb apobproxRc apobdistRa apobdistRb apobdistRc basalLsupera basalLsuperb basalLsuperc basalLmidsupera basalLmidsuperb basalLmidsuperc basalLmiddeepa basalLmiddeepb basalLmiddeepc basalLdeepa basalLdeepb basalLdeepc basalRsupera basalRsuperb basalRsuperc basalRmidsupera basalRmidsuperb basalRmidsuperc basalRmiddeepa basalRmiddeepb basalRmiddeepc basalRdeepa basalRdeepb basalRdeepc soma"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23RS}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Ex_ch22P23RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, B23FS - P23FRBa GABAa

str locationsB23FS = "soma basalLsupera basalLmidsupera basalLmiddeepa basalLdeepa basalRsupera basalRmidsupera basalRmiddeepa basalRdeepa apdend1 apdend2"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsB23FS}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Inh_ch22B23FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5IB - P23FRBa AMPA

str locationsP5IB = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL "

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5IB}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Ex_ch22P5IBAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5IB - P23FRBa NMDA

str locationsP5IB = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL "

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5IB}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Ex_ch22P5IBNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P6RS - P23FRBa AMPA

str locationsP6RS = "apdend4aL apdend4bL apdend4aR apdend4bR "

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP6RS}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Ex_ch22P6RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P6RS - P23FRBa NMDA

str locationsP6RS = "apdend4aL apdend4bL apdend4aR apdend4bR "


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP6RS}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Ex_ch22P6RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, C23FS - P23FRBa GABAa

str locationsC23FS = "axona "

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsC23FS}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Inh_ch22C23FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, C5FS - P23FRBa GABAa

str locationsC5FS = "axona "

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsC5FS}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Inh_ch22C5FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, ST4RS - P23FRBa AMPA

str locationsST4RS = "basalLsupera basalLsuperb basalLsuperc basalLmidsupera basalLmidsuperb basalLmidsuperc basalLmiddeepa basalLmiddeepb basalLmiddeepc basalLdeepa basalLdeepb basalLdeepc basalRsupera basalRsuperb basalRsuperc basalRmidsupera basalRmidsuperb basalRmidsuperc basalRmiddeepa basalRmiddeepb basalRmiddeepc basalRdeepa basalRdeepb basalRdeepc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsST4RS}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Ex_ch22ST4RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, ST4RS - P23FRBa NMDA

str locationsST4RS = "basalLsupera basalLsuperb basalLsuperc basalLmidsupera basalLmidsuperb basalLmidsuperc basalLmiddeepa basalLmiddeepb basalLmiddeepc basalLdeepa basalLdeepb basalLdeepc basalRsupera basalRsuperb basalRsuperc basalRmidsupera basalRmidsuperb basalRmidsuperc basalRmiddeepa basalRmiddeepb basalRmiddeepc basalRdeepa basalRdeepb basalRdeepc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsST4RS}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Ex_ch22ST4RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, I23LTS - P23FRBa GABAa

str locationsI23LTS = "basalLsuperb basalLmidsuperb basalLmiddeepb basalLdeepb basalRsuperb basalRmidsuperb basalRmiddeepb basalRdeepb basalLsuperc basalLmidsuperc basalLmiddeepc basalLdeepc basalRsuperc basalRmidsuperc basalRmiddeepc basalRdeepc apdend3 apdend4aR apdend4bR apdend4aL apdend4bL apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRLL apdend5bRLL apdend5cRLL apdend5aRL apdend5bRL apdend5cRL apdend5aRR apdend5bRR apdend5cRR apdend5aRRR apdend5bRRR apdend5cRRR apobdistRb apobdistRc apobproxRb apobproxRc apobdistLb apobdistLc apobproxLb apobproxLc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI23LTS}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Inh_ch22I23LTSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, I5LTS - P23FRBa GABAa

str locationsI5LTS = "basalLsuperb basalLmidsuperb basalLmiddeepb basalLdeepb basalRsuperb basalRmidsuperb basalRmiddeepb basalRdeepb basalLsuperc basalLmidsuperc basalLmiddeepc basalLdeepc basalRsuperc basalRmidsuperc basalRmiddeepc basalRdeepc apdend3 apdend4aR apdend4bR apdend4aL apdend4bL apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRLL apdend5bRLL apdend5cRLL apdend5aRL apdend5bRL apdend5cRL apdend5aRR apdend5bRR apdend5cRR apdend5aRRR apdend5bRRR apdend5cRRR apobdistRb apobdistRc apobproxRb apobproxRc apobdistLb apobdistLc apobproxLb apobproxLc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI5LTS}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Inh_ch22I5LTSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, TCR - P23FRBa AMPA

str locationsTCR = "apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRLL apdend5bRLL apdend5cRLL apdend5aRL apdend5bRL apdend5cRL apdend5aRR apdend5bRR apdend5cRR apdend5aRRR apdend5bRRR apdend5cRRR"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsTCR}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Ex_ch22TCRAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, TCR - P23FRBa NMDA

str locationsTCR = "apdend5aLLL apdend5bLLL apdend5cLLL apdend5aLL apdend5bLL apdend5cLL apdend5aLR apdend5bLR apdend5cLR apdend5aLRR apdend5bLRR apdend5cLRR apdend5aRLL apdend5bRLL apdend5cRLL apdend5aRL apdend5bRL apdend5cRL apdend5aRR apdend5bRR apdend5cRR apdend5aRRR apdend5bRRR apdend5cRRR"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsTCR}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Ex_ch22TCRNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P23FRB - P23FRBa AMPA

str locationsP23FRB = "apobproxLa apobproxLb apobproxLc apobdistLa apobdistLb apobdistLc apobproxRa apobproxRb apobproxRc apobdistRa apobdistRb apobdistRc basalLsupera basalLsuperb basalLsuperc basalLmidsupera basalLmidsuperb basalLmidsuperc basalLmiddeepa basalLmiddeepb basalLmiddeepc basalLdeepa basalLdeepb basalLdeepc basalRsupera basalRsuperb basalRsuperc basalRmidsupera basalRmidsuperb basalRmidsuperc basalRmiddeepa basalRmiddeepb basalRmiddeepc basalRdeepa basalRdeepb basalRdeepc soma"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23FRB}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Ex_ch22P23FRBAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P23FRB - P23FRBa NMDA

str locationsP23FRB = "apobproxLa apobproxLb apobproxLc apobdistLa apobdistLb apobdistLc apobproxRa apobproxRb apobproxRc apobdistRa apobdistRb apobdistRc basalLsupera basalLsuperb basalLsuperc basalLmidsupera basalLmidsuperb basalLmidsuperc basalLmiddeepa basalLmiddeepb basalLmiddeepc basalLdeepa basalLdeepb basalLdeepc basalRsupera basalRsuperb basalRsuperc basalRmidsupera basalRmidsuperb basalRmidsuperc basalRmiddeepa basalRmiddeepb basalRmiddeepc basalRdeepa basalRdeepb basalRdeepc soma"


for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23FRB}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Ex_ch22P23FRBNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5RS - P23FRBa AMPA

str locationsP5RS = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL "

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5RS}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Ex_ch22P5RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5RS - P23FRBa NMDA

str locationsP5RS = "apdend3 apdend4aL apdend4bL apdend4aR apdend4bR apdend5aLLL apdend5aLL apdend5aLR apdend5aLRR apdend5aRRR apdend5aRR apdend5aRL apdend5aRLL "

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5RS}})

          addmsg /P23FRBanet/P23FRBa[{k}]/{s}/Ex_ch22P5RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end
