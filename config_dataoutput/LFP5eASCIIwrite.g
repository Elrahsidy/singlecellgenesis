// genesis
// LFP5eASCIIwrite.g

echo LFP5eASCIIwrite
//echo {narraycolumns}

for (j=0;j<={narraycolumns};j=j+1)

     if ({mynode < 10})
         do_asc_file ./data/LFP5e{j}.column0{mynode} LFP{j} field LFP{j}file
     else
         do_asc_file ./data/LFP5e{j}.column{mynode} LFP{j} field LFP{j}file
     end

end
