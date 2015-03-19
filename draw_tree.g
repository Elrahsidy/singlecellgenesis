str element
str mysource
str mydest

// foreach element ({el /#net/#[]/#/Inh_ch#,/#net/#[]/#/Ex_ch#})
//    int syncount = {getsyncount {element}}
//    for (i=0; i<=syncount-1; i=i+1) 
//       mysource = {getsynsrc {element} {i}}
//       if ({mysource} != "/post")
//          echo {getsynsrc {element} {i}} {getfield {getsynsrc {element} {i}} x} {getfield {getsynsrc {element} {i}} y} {getfield {getsynsrc {element} {i}} z} {element} {getfield {element} x} {getfield {element} y} {getfield {element} z}
//       end
//    end
// end

// For each soma/spike generator, list outgoing messages and destination properties
int thisnode
for (thisnode=0; {thisnode < {Nnodes}}; thisnode={{thisnode}+1})
    foreach element ({el /#net/#[]/soma/spk1})
    //    int syncount = {getsyncount {element}}
    //    for (i=0; i<=syncount-1; i=i+1) 
    //        mydest = {getsyndest {element} {i}}
    //        echo {element} {mydest}
    //    end
        echo@{thisnode}
        echo@{thisnode} Listing connections for {element} on node {thisnode}
        rshowmsg@{thisnode} {element}; barrier
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
