// genesis

// LFP Calculation from cellular network,taken at specified point.
// Specifically for P5RSa synaptic currents

echo P5RSa Synaptic Currents - LFP Setup !!!!!!!!!!!!!!!!!!!!!
echo

str s

int k, kmax

kmax = P5RSa_NX*P5RSa_NY-1

//Load synapse location array, P23RS - P5RSa AMPA

str locationsP23RS = "apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23RS}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Ex_ch23P23RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P23RS - P5RSa NMDA

str locationsP23RS = "apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23RS}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Ex_ch23P23RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5IB - P5RSa AMPA

str locationsP5IB = "apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12 apdend13 apobdistLa apobdistLb apobdistLc apobmidLa apobmidLb apobmidLc apobproxLa apobproxLb apobproxLc apobdistRa apobdistRb apobdistRc apobmidRa apobmidRb apobmidRc apobproxRa apobproxRb apobproxRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc basaldeepa basaldeepb basaldeepc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5IB}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Ex_ch23P5IBAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5IB - P5RSa NMDA

str locationsP5IB = "apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12 apdend13 apobdistLa apobdistLb apobdistLc apobmidLa apobmidLb apobmidLc apobproxLa apobproxLb apobproxLc apobdistRa apobdistRb apobdistRc apobmidRa apobmidRb apobmidRc apobproxRa apobproxRb apobproxRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc basaldeepa basaldeepb basaldeepc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5IB}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Ex_ch23P5IBNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, B5FS - P5RSa GABAa

str locationsB5FS = "soma apdend1 apdend2 basalLsupera basalLmida basalRsupera basalRmida basaldeepa"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsB5FS}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Inh_ch23B5FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P6RS - P5RSa AMPA

str locationsP6RS = "apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12 apdend13 apobdistLa apobdistLb apobdistLc apobmidLa apobmidLb apobmidLc apobproxLa apobproxLb apobproxLc apobdistRa apobdistRb apobdistRc apobmidRa apobmidRb apobmidRc apobproxRa apobproxRb apobproxRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc basaldeepa basaldeepb basaldeepc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP6RS}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Ex_ch23P6RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P6RS - P5RSa NMDA

str locationsP6RS = "apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12 apdend13 apobdistLa apobdistLb apobdistLc apobmidLa apobmidLb apobmidLc apobproxLa apobproxLb apobproxLc apobdistRa apobdistRb apobdistRc apobmidRa apobmidRb apobmidRc apobproxRa apobproxRb apobproxRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc basaldeepa basaldeepb basaldeepc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP6RS}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Ex_ch23P6RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, C23FS - P5RSa GABAa

str locationsC23FS = "axona "

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsC23FS}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Inh_ch23C23FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, C5FS - P5RSa GABAa

str locationsC5FS = "axona "

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsC5FS}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Inh_ch23C5FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, ST4RS - P5RSa AMPA

str locationsST4RS = "apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apobdistLa apobmidLa apobproxLa apobdistRa apobmidRa apobproxRa"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsST4RS}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Ex_ch23ST4RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, ST4RS - P5RSa NMDA

str locationsST4RS = "apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apobdistLa apobmidLa apobproxLa apobdistRa apobmidRa apobproxRa"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsST4RS}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Ex_ch23ST4RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, I23LTS - P5RSa GABAa

str locationsI23LTS = "apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12 apdend13 apdend14aR apdend14bR apdend14cR apdend14dR apdend14aL apdend14bL apdend14cL apdend14dL basalLsuperb basalLsuperc basalLmidb basalLmidc basalRsuperb basalRsuperc basalRmidb basalRmidc basaldeepb basaldeepc apobdistRb apobdistRc apobmidRb apobmidRc apobproxRb apobproxRc apobdistLb apobdistLc apobmidLb apobmidLc apobproxLb apobproxLc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI23LTS}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Inh_ch23I23LTSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, I5LTS - P5RSa GABAa

str locationsI5LTS = "apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12 apdend13 apdend14aR apdend14bR apdend14cR apdend14dR apdend14aL apdend14bL apdend14cL apdend14dL basalLsuperb basalLsuperc basalLmidb basalLmidc basalRsuperb basalRsuperc basalRmidb basalRmidc basaldeepb basaldeepc apobdistRb apobdistRc apobmidRb apobmidRc apobproxRb apobproxRc apobdistLb apobdistLc apobmidLb apobmidLc apobproxLb apobproxLc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI5LTS}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Inh_ch23I5LTSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, TCR - P5RSa AMPA

str locationsTCR = "apdend13 apdend14aR apdend14bR apdend14cR apdend14dR apdend14aL apdend14bL apdend14cL apdend14dL"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsTCR}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Ex_ch23TCRAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, TCR - P5RSa NMDA

str locationsTCR = "apdend13 apdend14aR apdend14bR apdend14cR apdend14dR apdend14aL apdend14bL apdend14cL apdend14dL"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsTCR}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Ex_ch23TCRNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P23FRB - P5RSa AMPA

str locationsP23FRB = "apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23FRB}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Ex_ch23P23FRBAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P23FRB - P5RSa NMDA

str locationsP23FRB = "apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23FRB}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Ex_ch23P23FRBNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5RS - P5RSa AMPA

str locationsP5RS = "apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12 apdend13 apobdistLa apobdistLb apobdistLc apobmidLa apobmidLb apobmidLc apobproxLa apobproxLb apobproxLc apobdistRa apobdistRb apobdistRc apobmidRa apobmidRb apobmidRc apobproxRa apobproxRb apobproxRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc basaldeepa basaldeepb basaldeepc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5RS}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Ex_ch23P5RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5RS - P5RSa NMDA

str locationsP5RS = "apdend1 apdend2 apdend3 apdend4 apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12 apdend13 apobdistLa apobdistLb apobdistLc apobmidLa apobmidLb apobmidLc apobproxLa apobproxLb apobproxLc apobdistRa apobdistRb apobdistRc apobmidRa apobmidRb apobmidRc apobproxRa apobproxRb apobproxRc basalLsupera basalLsuperb basalLsuperc basalLmida basalLmidb basalLmidc basalRsupera basalRsuperb basalRsuperc basalRmida basalRmidb basalRmidc basaldeepa basaldeepb basaldeepc"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5RS}})

          addmsg /P5RSanet/P5RSa[{k}]/{s}/Ex_ch23P5RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end
