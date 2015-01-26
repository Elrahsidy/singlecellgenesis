// genesis

// LFP Calculation from cellular network,taken at specified point.
// Specifically for ST4RS synaptic currents

echo ST4RS Synaptic Currents - LFP Setup !!!!!!!!!!!!!!!!!!!!!
echo

str s

int k, kmax

kmax = ST4RS_NX*ST4RS_NY-1

//Load synapse location array, P23RS - ST4RS AMPA

str locationsP23RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23RS}})

          addmsg /ST4RSnet/ST4RS[{k}]/{s}/Ex_ch17P23RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end


//Load synapse location array, P23RS - ST4RS NMDA

str s

//Load synapse location array

str locationsP23RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23RS}})

          addmsg /ST4RSnet/ST4RS[{k}]/{s}/Ex_ch17P23RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, B23FS - ST4RS GABAa

str s

//Load synapse location array

str locationsB23FS = "soma proxdendN proxdendE proxdendS proxdendW"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsB23FS}})

          addmsg /ST4RSnet/ST4RS[{k}]/{s}/Inh_ch17B23FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5IB - ST4RS AMPA

str s

//Load synapse location array

str locationsP5IB = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5IB}})

          addmsg /ST4RSnet/ST4RS[{k}]/{s}/Ex_ch17P5IBAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5IB - ST4RS NMDA

str s

//Load synapse location array

str locationsP5IB = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5IB}})

          addmsg /ST4RSnet/ST4RS[{k}]/{s}/Ex_ch17P5IBNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, B5FS - ST4RS GABAa

str s

//Load synapse location array

str locationsB5FS = "soma proxdendN proxdendE proxdendS proxdendW"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsB5FS}})

          addmsg /ST4RSnet/ST4RS[{k}]/{s}/Inh_ch17B5FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P6RS - ST4RS AMPA

str s

//Load synapse location array

str locationsP6RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP6RS}})

          addmsg /ST4RSnet/ST4RS[{k}]/{s}/Ex_ch17P6RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P6RS - ST4RS NMDA

str s

//Load synapse location array

str locationsP6RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP6RS}})

          addmsg /ST4RSnet/ST4RS[{k}]/{s}/Ex_ch17P6RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, C23FS - ST4RS GABAa

str s

//Load synapse location array

str locationsC23FS = "axona"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsC23FS}})

          addmsg /ST4RSnet/ST4RS[{k}]/{s}/Inh_ch17C23FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, C5FS - ST4RS GABAa

str s

//Load synapse location array

str locationsC5FS = "axona"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsC5FS}})

          addmsg /ST4RSnet/ST4RS[{k}]/{s}/Inh_ch17C5FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, ST4RS - ST4RS AMPA

str locationsST4RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsST4RS}})

          addmsg /ST4RSnet/ST4RS[{k}]/{s}/Ex_ch17ST4RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end


//Load synapse location array, ST4RS - ST4RS NMDA

str s

//Load synapse location array

str locationsST4RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsST4RS}})

          addmsg /ST4RSnet/ST4RS[{k}]/{s}/Ex_ch17ST4RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, I23LTS - ST4RS GABAa

str s

//Load synapse location array

str locationsI23LTS = "distdendNlongb distdendNlongc distdendNlongd distdendNlonge distdendNlongf distdendNlongg distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendElongd distdendElonge distdendElongf distdendElongg distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSlongd distdendSlonge distdendSlongf distdendSlongg distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWlongd distdendWlonge distdendWlongf distdendWlongg distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI23LTS}})

          addmsg /ST4RSnet/ST4RS[{k}]/{s}/Inh_ch17I23LTSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, I5LTS - ST4RS GABAa

str s

//Load synapse location array

str locationsI5LTS = "distdendNlongb distdendNlongc distdendNlongd distdendNlonge distdendNlongf distdendNlongg distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendElongd distdendElonge distdendElongf distdendElongg distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSlongd distdendSlonge distdendSlongf distdendSlongg distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWlongd distdendWlonge distdendWlongf distdendWlongg distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI5LTS}})

          addmsg /ST4RSnet/ST4RS[{k}]/{s}/Inh_ch17I5LTSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, TCR - ST4RS AMPA

str s

//Load synapse location array

str locationsTCR = "proxdendN distdendNlonga distdendNlongb distdendNlongc distdendNlongd distdendNlonge distdendNlongf distdendNlongg distdendNmida distdendNmidb distdendNmidc distdendNshorta distdendNshortb proxdendE distdendElonga distdendElongb distdendElongc distdendElongd distdendElonge distdendElongf distdendElongg distdendEmida distdendEmidb distdendEmidc distdendEshorta distdendEshortb proxdendS distdendSlonga distdendSlongb distdendSlongc distdendSlongd distdendSlonge distdendSlongf distdendSlongg distdendSmida distdendSmidb distdendSmidc distdendSshorta distdendSshortb proxdendW distdendWlonga distdendWlongb distdendWlongc distdendWlongd distdendWlonge distdendWlongf distdendWlongg distdendWmida distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsTCR}})

          addmsg /ST4RSnet/ST4RS[{k}]/{s}/Ex_ch17TCRAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, TCR - ST4RS NMDA

str s

//Load synapse location array

str locationsTCR = "proxdendN distdendNlonga distdendNlongb distdendNlongc distdendNlongd distdendNlonge distdendNlongf distdendNlongg distdendNmida distdendNmidb distdendNmidc distdendNshorta distdendNshortb proxdendE distdendElonga distdendElongb distdendElongc distdendElongd distdendElonge distdendElongf distdendElongg distdendEmida distdendEmidb distdendEmidc distdendEshorta distdendEshortb proxdendS distdendSlonga distdendSlongb distdendSlongc distdendSlongd distdendSlonge distdendSlongf distdendSlongg distdendSmida distdendSmidb distdendSmidc distdendSshorta distdendSshortb proxdendW distdendWlonga distdendWlongb distdendWlongc distdendWlongd distdendWlonge distdendWlongf distdendWlongg distdendWmida distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsTCR}})

          addmsg /ST4RSnet/ST4RS[{k}]/{s}/Ex_ch17TCRNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end
