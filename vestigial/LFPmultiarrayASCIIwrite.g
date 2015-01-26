// genesis
// LFPmultiarrayASCIIwrite.g

echo LFPmultiarrayASCIIwrite
//echo {narraycolumns}

for (j=0;j<={narraycolumns};j=j+1)

     do_asc_file ./data/LFParray{j}.dat{mynode} LFP{j} field LFP{j}file

end
