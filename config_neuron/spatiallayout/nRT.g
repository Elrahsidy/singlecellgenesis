// genesis

// Arranging the nRT cells in space.

echo Creating nRT network

float originxmin
float originymin

// Unique number for each cell type (same as spike number)
int typenum = 21
str typename = "nRT"

int ydex
float placer

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.


int i,j,istartdex
int k = 0
float zposarb = -0.05125

placer = {mynode}/{sqrtNnodes}

//echo placer= {placer}

ydex = { round {placer} }

//echo ydex= {ydex}

originxmin = {regionoffsetx}+({mynode}-{ydex}*sqrtNnodes)*nRT_NX*nRT_SEPX

//echo originxmin= {originxmin}

originymin = {regionoffsety}+{ydex}*nRT_NY*nRT_SEPY

//echo originymin= {originymin}

create neutral /nRTnet

// Random orientation
float randrotation
addfield /nRT rotation

if ({{{output} == 1} & {{membranepotentialoutput} == 1}})
     create asc_file /Vmwrite{typenum}
     setfield /Vmwrite{typenum} filename ./data-latest/membrane.{typename}.{myzeropadnode} flush 1 leave_open 1 append 0 float_format %0.9g
end

if ({columntype == 0})

     for (j = 0; j < nRT_NY; j = j+1)
          for (i = 0; i < nRT_NX; i = i+1)

               copy /nRT /nRTnet/nRT[{k}]
               position /nRTnet/nRT[{k}] \
                 {originxmin + nRT_SEPX*i} {originymin + nRT_SEPY*j} {zposarb}
               if ({{{output} == 1} & {{membranepotentialoutput} == 1}})
                    addmsg /nRTnet/nRT[{k}]/soma /Vmwrite{typenum} SAVE Vm
               end

               k=k+1

          end
     end

end

if ({columntype == 1})

echo Traub nRT!

     for (j = 0; j < nRT_NY; j = j+1)

          istartdex = {trunc {j/2}}*2-j+1

          for (i = istartdex; i < nRT_NX; i = i+2)
              
               copy /nRT /nRTnet/nRT[{k}]
               position /nRTnet/nRT[{k}] \
                 {originxmin + nRT_SEPX*i} {originymin + nRT_SEPY*j} {zposarb}

               // Rotate about z-axis ("twirl" in GENESIS cellsheet terminology)
               if ({rotateneurons} == 1)
                   randrotation = {rand 0 6.283185308 }
                   setfield /nRTnet/nRT[{k}] rotation {randrotation} // save for posterity
                   rotcoord /nRTnet/nRT[{k}] {randrotation} -z -center {originxmin + nRT_SEPX*i} {originymin + nRT_SEPY*j} {zposarb}
               end

               if ({{{output} == 1} & {{membranepotentialoutput} == 1}})
                    addmsg /nRTnet/nRT[{k}]/soma /Vmwrite{typenum} SAVE Vm
               end

               k=k+1

               echo Position nRT {mynode} {myregion} {i} {j} {originxmin} {originymin} {originxmin + nRT_SEPX*i} {originymin + nRT_SEPY*j} {zposarb} {randrotation}

          end
     end

end
