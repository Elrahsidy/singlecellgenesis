// genesis
// LFPmultiarrayASCIIwrite.g

echo LFPmultiarrayASCIIwrite
//echo {numelecs}

for (j=0;j<{numelecs};j=j+1)

     do_asc_file ./data/LFParray{j}.dat{mynode} LFP{j} field LFP{j}file

end
