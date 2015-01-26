// genesis

// Arranging the TCR cells in space.

echo Creating TCR network

float originxmin
float originymin

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

originxmin = ({mynode}-{ydex}*sqrtNnodes)*TCR_NX*TCR_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*TCR_NY*TCR_SEPY

//echo originymin= {originymin}

create neutral /TCRnet

if ({columntype == 0})

     for (j = 0; j < TCR_NY; j = j+1)
          for (i = 0; i < TCR_NX; i = i+1)

               copy /TCR /TCRnet/TCR[{k}]
               position /TCRnet/TCR[{k}] \
                 {originxmin + TCR_SEPX*i} {originymin + TCR_SEPY*j} {zposarb}
               k=k+1

          end
     end

end

if ({columntype == 1})

echo Traub TCR!

     for (j = 0; j < TCR_NY; j = j+1)

          istartdex = {trunc {j/2}}*2-j+1

          for (i = istartdex; i < TCR_NX; i = i+2)
              
               copy /TCR /TCRnet/TCR[{k}]
               position /TCRnet/TCR[{k}] \
                 {originxmin + TCR_SEPX*i} {originymin + TCR_SEPY*j} {zposarb}
               k=k+1

               echo Position TCR {mynode} {i} {j} {originxmin} {originymin} {originxmin + TCR_SEPX*i} {originymin + TCR_SEPY*j} {randzpos}

          end
     end

end
