// genesis

// Arranging the I23LTS cells in space.

echo Creating I23LTS network

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

float originxmin
float originymin

int ydex
float placer

int i,j,istartdex
int k = 0
float randzpos

placer = {mynode}/{sqrtNnodes}

//echo placer= {placer}

ydex = { round {placer} }

//echo ydex= {ydex}

originxmin = ({mynode}-{ydex}*sqrtNnodes)*I23LTS_NX*I23LTS_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*I23LTS_NY*I23LTS_SEPY

//echo originymin= {originymin}

create neutral /I23LTSnet

if ({columntype == 0})

     for (j = 0; j < I23LTS_NY; j = j+1)
          for (i = 0; i < I23LTS_NX; i = i+1)

               randzpos = { rand 1602e-6 2871e-6 }

               copy /I23LTS /I23LTSnet/I23LTS[{k}]
               position /I23LTSnet/I23LTS[{k}] \
                 {originxmin + I23LTS_SEPX*i} {originymin + I23LTS_SEPY*j} {randzpos}
               k=k+1

          end
     end

end

if ({columntype == 1})

echo Traub I23LTS!

     for (j = 0; j < I23LTS_NY; j = j+1)

          istartdex = j-{trunc {j/2}}*2

          for (i = istartdex; i < I23LTS_NX; i = i+2)
              
               randzpos = { rand 1602e-6 2871e-6 }

               copy /I23LTS /I23LTSnet/I23LTS[{k}]
               position /I23LTSnet/I23LTS[{k}] \
                 {originxmin + I23LTS_SEPX*i} {originymin + I23LTS_SEPY*j} {randzpos}
               k=k+1

               echo Position I23LTS {mynode} {i} {j} {originxmin} {originymin} {originxmin + I23LTS_SEPX*i} {originymin + I23LTS_SEPY*j} {randzpos}

          end
     end

end
