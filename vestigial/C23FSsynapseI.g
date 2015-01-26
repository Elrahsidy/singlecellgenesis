// genesis

// LFP Calculation from cellular network,taken at specified point.
// Specifically for C23FS synaptic currents

echo C23FS Synaptic Currents - LFP Setup !!!!!!!!!!!!!!!!!!!!!
echo

str s

int k, kmax

if ({columntype == 0})

     kmax = C23FS_NX*C23FS_NY-1

end

if ({columntype == 1})

     kmax = {C23FS_NX/2}*C23FS_NY-1

end

//Load synapse location array, P23RS - C23FS AMPA

str locationsP23RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23RS}})

          addmsg /C23FSnet/C23FS[{k}]/{s}/Ex_ch15P23RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P23RS - C23FS NMDA

str locationsP23RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23RS}})

          addmsg /C23FSnet/C23FS[{k}]/{s}/Ex_ch15P23RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, B23FS - C23FS GABAa

str locationsB23FS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsB23FS}})

          addmsg /C23FSnet/C23FS[{k}]/{s}/Inh_ch15B23FSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5IB - C23FS AMPA

str locationsP5IB = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5IB}})

          addmsg /C23FSnet/C23FS[{k}]/{s}/Ex_ch15P5IBAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5IB - C23FS NMDA

str locationsP5IB = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5IB}})

          addmsg /C23FSnet/C23FS[{k}]/{s}/Ex_ch15P5IBNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P6RS - C23FS AMPA

str locationsP6RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP6RS}})

          addmsg /C23FSnet/C23FS[{k}]/{s}/Ex_ch15P6RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P6RS - C23FS NMDA

str locationsP6RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP6RS}})

          addmsg /C23FSnet/C23FS[{k}]/{s}/Ex_ch15P6RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, I23LTS - C23FS GABAa

str locationsI23LTS = "distdendNlongb distdendNlongc distdendNlongd distdendNlonge distdendNlongf distdendNlongg distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendElongd distdendElonge distdendElongf distdendElongg distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSlongd distdendSlonge distdendSlongf distdendSlongg distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWlongd distdendWlonge distdendWlongf distdendWlongg distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI23LTS}})

          addmsg /C23FSnet/C23FS[{k}]/{s}/Inh_ch15I23LTSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, I5LTS - C23FS GABAa

str locationsI5LTS = "distdendNlongb distdendNlongc distdendNlongd distdendNlonge distdendNlongf distdendNlongg distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendElongd distdendElonge distdendElongf distdendElongg distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSlongd distdendSlonge distdendSlongf distdendSlongg distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWlongd distdendWlonge distdendWlongf distdendWlongg distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsI5LTS}})

          addmsg /C23FSnet/C23FS[{k}]/{s}/Inh_ch15I5LTSGABAa LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, TCR - C23FS AMPA

str locationsTCR = "proxdendN distdendNmida distdendNlonga proxdendE distdendElonga distdendEmida proxdendS distdendSlonga distdendSmida proxdendW distdendWlonga distdendWmida"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsTCR}})

          addmsg /C23FSnet/C23FS[{k}]/{s}/Ex_ch15TCRAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, TCR - C23FS NMDA

str locationsTCR = "proxdendN distdendNmida distdendNlonga proxdendE distdendElonga distdendEmida proxdendS distdendSlonga distdendSmida proxdendW distdendWlonga distdendWmida"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsTCR}})

          addmsg /C23FSnet/C23FS[{k}]/{s}/Ex_ch15TCRNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P23FRB - C23FS AMPA

str locationsP23FRB = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23FRB}})

          addmsg /C23FSnet/C23FS[{k}]/{s}/Ex_ch15P23FRBAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P23FRB - C23FS NMDA

str locationsP23FRB = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP23FRB}})

          addmsg /C23FSnet/C23FS[{k}]/{s}/Ex_ch15P23FRBNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5RS - C23FS AMPA

str locationsP5RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5RS}})

          addmsg /C23FSnet/C23FS[{k}]/{s}/Ex_ch15P5RSAMPA LFPsynmodcent CURRENT Ik 0.0

     end

end

//Load synapse location array, P5RS - C23FS NMDA

str locationsP5RS = "distdendNlongb distdendNlongc distdendNmidb distdendNmidc distdendNshorta distdendNshortb distdendElongb distdendElongc distdendEmidb distdendEmidc distdendEshorta distdendEshortb distdendSlongb distdendSlongc distdendSmidb distdendSmidc distdendSshorta distdendSshortb distdendWlongb distdendWlongc distdendWmidb distdendWmidc distdendWshorta distdendWshortb"

for (k=0;k<={kmax};k=k+1)

     foreach s ({arglist {locationsP5RS}})

          addmsg /C23FSnet/C23FS[{k}]/{s}/Ex_ch15P5RSNMDA LFPsynmodcent CURRENT Ik 0.0

     end

end
