// genesis

// Arranging the B23FS cells in space.

echo Creating B23FS network

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

float originxmin
float originymin

// Unique number for each cell type (same as spike number)
int typenum = 5

int ydex
float placer

int i,j,istartdex
int k = 0
float randzpos

placer = {mynode}/{sqrtNnodes}

//echo placer= {placer}

ydex = { round {placer} }

//echo ydex= {ydex}

originxmin = ({mynode}-{ydex}*sqrtNnodes)*B23FS_NX*B23FS_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*B23FS_NY*B23FS_SEPY

//echo originymin= {originymin}

create neutral /B23FSnet

if ({columntype == 0})

     for (j = 0; j < B23FS_NY; j = j+1)
          for (i = 0; i < B23FS_NX; i = i+1)

               randseed { {trunc {{{{originxmin}+{B23FS_SEPX}*{i}}/{SEPX}}}+1} @0@ {trunc {{{{originymin}+{B23FS_SEPY}*{i}}/{SEPY}}}+1} @0@ {k} @0@ {typenum} @ {substring {myrandseed} {{strlen {myrandseed}}-2}} }
               randzpos = { rand 1602e-6 2871e-6 }

               copy /B23FS /B23FSnet/B23FS[{k}]
               position /B23FSnet/B23FS[{k}] \
                 {originxmin + B23FS_SEPX*i} {originymin + B23FS_SEPY*j} {randzpos}
               k=k+1

          end
     end

end

if ({columntype == 1})

echo Traub B23FS!

     for (j = 0; j < B23FS_NY; j = j+1)

          istartdex = j-{trunc {j/2}}*2

          for (i = istartdex; i < B23FS_NX; i = i+2)

               int newrandseed = {{ {typenum} @0@ {trunc {{{originxmin}+{B23FS_SEPX}*{i}}/{SEPX}}} @0@ {trunc {{{originymin}+{B23FS_SEPY}*{j}}/{SEPY}}} } + {myrandseed}}
               randseed {newrandseed}
               echo randseed {typenum} {trunc {{{originxmin}+{B23FS_SEPX}*{i}}/{SEPX}}} {trunc {{{originymin}+{B23FS_SEPY}*{j}}/{SEPY}}} {myrandseed} {newrandseed}

               // Old myrandseed substring (bad because seeds ending in same two least significant digits will yield same random seed)
               //@ {substring {myrandseed} {{strlen {myrandseed}}-2}}

               randzpos = { rand 1602e-6 2871e-6 }
               //echo randseedB23FS {trunc {{{{originxmin}+{B23FS_SEPX}*{i}}/{SEPX}}}} {trunc {{{{originymin}+{B23FS_SEPY}*{i}}/{SEPY}}}} {randzpos}
               //echo randseednotruncB23FS {mynode} {{{{{originxmin}+{B23FS_SEPX}*{i}}/{SEPX}}}} {{{{{originymin}+{B23FS_SEPY}*{i}}/{SEPY}}}} {randzpos} {k}

               copy /B23FS /B23FSnet/B23FS[{k}]
               position /B23FSnet/B23FS[{k}] \
                 {originxmin + B23FS_SEPX*i} {originymin + B23FS_SEPY*j} {randzpos}
               k=k+1

               echo Position B23FS {mynode} {i} {j} {originxmin} {originymin} {originxmin + B23FS_SEPX*i} {originymin + B23FS_SEPY*j} {randzpos}

          end
     end

end
