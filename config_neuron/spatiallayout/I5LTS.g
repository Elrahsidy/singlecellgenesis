// genesis

// Arranging the I5LTS cells in space.

echo Creating I5LTS network

float originxmin
float originymin

// Unique number for each cell type (same as spike number)
int typenum = 19

int ydex
float placer

int i,j,istartdex
int k = 0
float randzpos

placer = {mynode}/{sqrtNnodes}

//echo placer= {placer}

ydex = { round {placer} }

//echo ydex= {ydex}

originxmin = ({mynode}-{ydex}*sqrtNnodes)*I5LTS_NX*I5LTS_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*I5LTS_NY*I5LTS_SEPY

//echo originymin= {originymin}

create neutral /I5LTSnet

if ({columntype == 0})

     for (j = 0; j < I5LTS_NY; j = j+1)
          for (i = 0; i < I5LTS_NX; i = i+1)

               int newrandseed = {{ {typenum} @0@ {trunc {{{originxmin}+{B23FS_SEPX}*{i}}/{SEPX}}} @0@ {trunc {{{originymin}+{B23FS_SEPY}*{j}}/{SEPY}}} } + {myrandseed}}
          randseed {newrandseed}
               randzpos = { rand 550e-6 1262e-6 }

               copy /I5LTS /I5LTSnet/I5LTS[{k}]
               position /I5LTSnet/I5LTS[{k}] \
                 {originxmin + I5LTS_SEPX*i} {originymin + I5LTS_SEPY*j} {randzpos}
               k=k+1

          end
     end

end

if ({columntype == 1})

echo Traub I5LTS!

     for (j = 0; j < I5LTS_NY; j = j+1)

          istartdex = {trunc {j/2}}*2-j+1

          for (i = istartdex; i < I5LTS_NX; i = i+2)
              
               int newrandseed = {{ {typenum} @0@ {trunc {{{originxmin}+{B23FS_SEPX}*{i}}/{SEPX}}} @0@ {trunc {{{originymin}+{B23FS_SEPY}*{j}}/{SEPY}}} } + {myrandseed}}
          randseed {newrandseed}
               randzpos = { rand 550e-6 1262e-6 }

               copy /I5LTS /I5LTSnet/I5LTS[{k}]
               position /I5LTSnet/I5LTS[{k}] \
                 {originxmin + I5LTS_SEPX*i} {originymin + I5LTS_SEPY*j} {randzpos}
               k=k+1

               echo Position I5LTS {mynode} {i} {j} {originxmin} {originymin} {originxmin + I5LTS_SEPX*i} {originymin + I5LTS_SEPY*j} {randzpos}

          end
     end

end
