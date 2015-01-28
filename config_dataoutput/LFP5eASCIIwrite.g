// genesis
// LFP5eASCIIwrite.g

//echo LFP5eASCIIwrite
//echo {numelecs}

int myzeropadnode = {mynode}
if({mynode} < 10)
    myzeropadnode = "0{mynode}"

    if({mynode} == 0)
        myzeropadnode = "00{mynode}"
    end
end

for (j=0;j<{numelecs};j=j+1)
    do_asc_file ./data/LFP5.elec{j}.column0{myzeropadnode} LFP{j} field LFP{j}file
end
