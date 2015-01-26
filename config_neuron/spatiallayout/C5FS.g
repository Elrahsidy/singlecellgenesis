// genesis

// Arranging the C5FS cells in space.

echo Creating C5FS network

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

originxmin = ({mynode}-{ydex}*sqrtNnodes)*C5FS_NX*C5FS_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*C5FS_NY*C5FS_SEPY

//echo originymin= {originymin}

create neutral /C5FSnet

if ({columntype == 0})

     for (j = 0; j < C5FS_NY; j = j+1)
          for (i = 0; i < C5FS_NX; i = i+1)

               randzpos = { rand 550e-6 1262e-6 }

               copy /C5FS /C5FSnet/C5FS[{k}]
               position /C5FSnet/C5FS[{k}] \
                 {originxmin + C5FS_SEPX*i} {originymin + C5FS_SEPY*j} {randzpos}
               k=k+1

          end
     end

end

if ({columntype == 1})

echo Traub C5FS!

     for (j = 0; j < C5FS_NY; j = j+1)

          istartdex = {trunc {j/2}}*2-j+1

          for (i = istartdex; i < C5FS_NX; i = i+2)
              
               randzpos = { rand 550e-6 1262e-6 }

               copy /C5FS /C5FSnet/C5FS[{k}]
               position /C5FSnet/C5FS[{k}] \
                 {originxmin + C5FS_SEPX*i} {originymin + C5FS_SEPY*j} {randzpos}
               k=k+1

               echo Position C5FS {mynode} {i} {j} {originxmin} {originymin} {originxmin + C5FS_SEPX*i} {originymin + C5FS_SEPY*j} {randzpos}

          end
     end

end
