str element
str mysource

foreach element ({el /#net/#[]/#/Inh_ch#,/#net/#[]/#/Ex_ch#})
   int syncount = {getsyncount {element}}
   for (i=0; i<=syncount-1; i=i+1) 
      mysource = {getsynsrc {element} {i}}
      if ({mysource} != "/post")
         echo {getsynsrc {element} {i}} {getfield {getsynsrc {element} {i}} x} {getfield {getsynsrc {element} {i}} y} {getfield {getsynsrc {element} {i}} z} {element} {getfield {element} x} {getfield {element} y} {getfield {element} z}
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
