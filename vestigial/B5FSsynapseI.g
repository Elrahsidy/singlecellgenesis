// genesis

// LFP Calculation from cellular network,taken at specified point.
// Specifically for B5FS synaptic currents

echo B5FS Synaptic Currents - LFP Setup !!!!!!!!!!!!!!!!!!!!!
echo

str s

int k, kmax

if ({columntype == 0})

     kmax = B5FS_NX*B5FS_NY-1

end

if ({columntype == 1})

     kmax = {B5FS_NX/2}*B5FS_NY-1

end

//Load synapse location array, P23RS - B5FS AMPA

str locationsP23RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23RS}})

          addmsg /B5FSnet/B5FS[{k}]/{s}/Ex_ch10P23RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end


//Load synapse location array, P23RS - B5FS NMDA

str locationsP23RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23RS}})

          addmsg /B5FSnet/B5FS[{k}]/{s}/Ex_ch10P23RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5IB - B5FS AMPA

str locationsP5IB = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5IB}})

          addmsg /B5FSnet/B5FS[{k}]/{s}/Ex_ch10P5IBAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5IB - B5FS NMDA

str locationsP5IB = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5IB}})

          addmsg /B5FSnet/B5FS[{k}]/{s}/Ex_ch10P5IBNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, B5FS - B5FS GABAa

str locationsB5FS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsB5FS}})

          addmsg /B5FSnet/B5FS[{k}]/{s}/Inh_ch10B5FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P6RS - B5FS AMPA

str locationsP6RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP6RS}})

          addmsg /B5FSnet/B5FS[{k}]/{s}/Ex_ch10P6RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P6RS - B5FS NMDA

str locationsP6RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP6RS}})

          addmsg /B5FSnet/B5FS[{k}]/{s}/Ex_ch10P6RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, ST4RS - B5FS AMPA

str locationsST4RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsST4RS}})

          addmsg /B5FSnet/B5FS[{k}]/{s}/Ex_ch10ST4RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, ST4RS - B5FS NMDA

str locationsST4RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsST4RS}})

          addmsg /B5FSnet/B5FS[{k}]/{s}/Ex_ch10ST4RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, I23LTS - B5FS GABAa

str locationsI23LTS ="distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI23LTS}})

          addmsg /B5FSnet/B5FS[{k}]/{s}/Inh_ch10I23LTSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, I5LTS - B5FS GABAa

str locationsI5LTS ="distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI5LTS}})

          addmsg /B5FSnet/B5FS[{k}]/{s}/Inh_ch10I5LTSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, TCR - B5FS AMPA

str locationsTCR = "proxdendN distdendNmida distdendNlonga proxdendE distdendElonga distdendEmida proxdendS distdendSlonga distdendSmida proxdendW distdendWlonga distdendWmida"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsTCR}})

          addmsg /B5FSnet/B5FS[{k}]/{s}/Ex_ch10TCRAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, TCR - B5FS NMDA

str locationsTCR = "proxdendN distdendNmida distdendNlonga proxdendE distdendElonga distdendEmida proxdendS distdendSlonga distdendSmida proxdendW distdendWlonga distdendWmida"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsTCR}})

          addmsg /B5FSnet/B5FS[{k}]/{s}/Ex_ch10TCRNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P23FRB - B5FS AMPA

str locationsP23FRB = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23FRB}})

          addmsg /B5FSnet/B5FS[{k}]/{s}/Ex_ch10P23FRBAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P23FRB - B5FS NMDA

str locationsP23FRB = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23FRB}})

          addmsg /B5FSnet/B5FS[{k}]/{s}/Ex_ch10P23FRBNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5RS - B5FS AMPA

str locationsP5RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5RS}})

          addmsg /B5FSnet/B5FS[{k}]/{s}/Ex_ch10P5RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5RS - B5FS NMDA

str locationsP5RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5RS}})

          addmsg /B5FSnet/B5FS[{k}]/{s}/Ex_ch10P5RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end
