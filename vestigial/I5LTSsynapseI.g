// genesis

// LFP Calculation from cellular network,taken at specified point.
// Specifically for I5LTS synaptic currents

echo I5LTS Synaptic Currents - LFP Setup !!!!!!!!!!!!!!!!!!!!!
echo

str s

int k, kmax

if ({columntype == 0})

     kmax = I5LTS_NX*I5LTS_NY-1

end

if ({columntype == 1})

     kmax = {I5LTS_NX/2}*I5LTS_NY-1

end

//Load synapse location array, P23RS - I5LTS AMPA

str locationsP23RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23RS}})

          addmsg /I5LTSnet/I5LTS[{k}]/{s}/Ex_ch19P23RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P23RS - I5LTS NMDA

str locationsP23RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23RS}})

          addmsg /I5LTSnet/I5LTS[{k}]/{s}/Ex_ch19P23RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5IB - I5LTS AMPA

str locationsP5IB = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5IB}})

          addmsg /I5LTSnet/I5LTS[{k}]/{s}/Ex_ch19P5IBAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5IB - I5LTS NMDA

str locationsP5IB = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5IB}})

          addmsg /I5LTSnet/I5LTS[{k}]/{s}/Ex_ch19P5IBNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, B5FS - I5LTS GABAa

str locationsB5FS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsB5FS}})

          addmsg /I5LTSnet/I5LTS[{k}]/{s}/Inh_ch19B5FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P6RS - I5LTS AMPA

str locationsP6RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP6RS}})

          addmsg /I5LTSnet/I5LTS[{k}]/{s}/Ex_ch19P6RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P6RS - I5LTS NMDA

str locationsP6RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP6RS}})

          addmsg /I5LTSnet/I5LTS[{k}]/{s}/Ex_ch19P6RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, ST4RS - I5LTS AMPA

str locationsST4RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsST4RS}})

          addmsg /I5LTSnet/I5LTS[{k}]/{s}/Ex_ch19ST4RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, ST4RS - I5LTS NMDA

str locationsST4RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsST4RS}})

          addmsg /I5LTSnet/I5LTS[{k}]/{s}/Ex_ch19ST4RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, I23LTS - I5LTS GABAa

str locationsI23LTS ="distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI23LTS}})

          addmsg /I5LTSnet/I5LTS[{k}]/{s}/Inh_ch19I23LTSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, I5LTS - I5LTS GABAa

str locationsI5LTS ="distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI5LTS}})

          addmsg /I5LTSnet/I5LTS[{k}]/{s}/Inh_ch19I5LTSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P23FRB - I5LTS AMPA

str locationsP23FRB = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23FRB}})

          addmsg /I5LTSnet/I5LTS[{k}]/{s}/Ex_ch19P23FRBAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P23FRB - I5LTS NMDA

str locationsP23FRB = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23FRB}})

          addmsg /I5LTSnet/I5LTS[{k}]/{s}/Ex_ch19P23FRBNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5RS - I5LTS AMPA

str locationsP5RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5RS}})

          addmsg /I5LTSnet/I5LTS[{k}]/{s}/Ex_ch19P5RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5RS - I5LTS NMDA

str locationsP5RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5RS}})

          addmsg /I5LTSnet/I5LTS[{k}]/{s}/Ex_ch19P5RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end
