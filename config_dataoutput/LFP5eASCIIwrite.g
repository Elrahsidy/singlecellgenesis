// genesis
// LFP5eASCIIwrite.g

echo LFP5eASCIIwrite
//echo {numelecs}

for (j=0;j<{numelecs};j=j+1)

     if ({mynode < 10})
         do_asc_file ./data/LFP5.elec{j}.column0{mynode} LFP{j} field LFP{j}file
     else
         do_asc_file ./data/LFP5.elec{j}.column{mynode} LFP{j} field LFP{j}file
     end

end
