str element
str shortelement
str mysource
str mydest
str outfile

// foreach element ({el /#net/#[]/#/Inh_ch#,/#net/#[]/#/Ex_ch#})
//    int syncount = {getsyncount {element}}
//    for (i=0; i<=syncount-1; i=i+1) 
//       mysource = {getsynsrc {element} {i}}
//       if ({mysource} != "/post")
//          echo {getsynsrc {element} {i}} {getfield {getsynsrc {element} {i}} x} {getfield {getsynsrc {element} {i}} y} {getfield {getsynsrc {element} {i}} z} {element} {getfield {element} x} {getfield {element} y} {getfield {element} z}
//       end
//    end
// end

// For each soma/spike generator on each node,
// list source properties and outgoing messages
int thisnode
foreach element ({el /#net/#[]/soma/spk#})
    for (thisnode=0; {thisnode < {Nnodes}}; thisnode={{thisnode}+1})
        if({mynode} == {thisnode})
            outfile = {"data/node" @ {thisnode} @ {strsub {element} / _ -all} @ ".txt"}
            echo@{thisnode} Listing connections for {element} on node {thisnode}; barrier
            echo@{thisnode} {element} {getfield {element} x} {getfield {element} y} {getfield {element} z} >> {outfile}; barrier
            rshowmsg@{thisnode} {element} >> {outfile}; barrier
        end
    end
end

// foreach element ({el /#net/#[]/#/Inh_ch#,/#net/#[]/#/Ex_ch#})
//    int syncount = {getsyncount {element}}
//    for (i=0; i<=syncount-1; i=i+1) 
//       mysource = {getsynsrc {element} {i}}
//       if ({mysource} == "/post")
//          echo {element}
//       end
//    end
// end
// 
