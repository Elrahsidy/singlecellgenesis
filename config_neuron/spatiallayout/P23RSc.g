// genesis

// Arranging the P23RSc cells in space.

echo Creating P23RSc network

//float	P23RSc_SEPX = 25e-6
//float	P23RSc_SEPY = 25e-6
//float	P23RSc_NX = 5
//float	P23RSc_NY = 5

float originxmin
float originymin

// Unique number for each cell type (same as spike number)
int typenum = 3

int ydex
float placer

float randzpos
int i,j
int k = 0

placer = {mynode}/{sqrtNnodes}

//echo placer= {placer}

ydex = { round {placer} }

//echo ydex= {ydex}

originxmin = ({mynode}-{ydex}*sqrtNnodes)*P23RSc_NX*P23RSc_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*P23RSc_NY*P23RSc_SEPY

//echo originymin= {originymin}

create neutral /P23RScnet

// CREATING THE PLANE OF P23RSc cells
//createmap /P23RSc /P23RScnet  \
//	{P23RSc_NX} {P23RSc_NY} \
//	-delta {P23RSc_SEPX} {P23RSc_SEPY} \
//	-origin {originxmin} {originymin}

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

for (j = 0; j < P23RSc_NY; j = j+1)
     for (i = 0; i < P23RSc_NX; i = i+1)

          int newrandseed = {{ {typenum} @0@ {trunc {{{originxmin}+{B23FS_SEPX}*{i}}/{SEPX}}} @0@ {trunc {{{originymin}+{B23FS_SEPY}*{j}}/{SEPY}}} } + {myrandseed}}
          randseed {newrandseed}
          randzpos = { rand 1602e-6 2871e-6 }

          copy /P23RSc /P23RScnet/P23RSc[{k}]
          position /P23RScnet/P23RSc[{k}] \
            {originxmin + P23RSc_SEPX*i} {originymin + P23RSc_SEPY*j} {randzpos}
          k=k+1

          echo Position P23RSc {mynode} {i} {j} {originxmin} {originymin} {originxmin + P23RSc_SEPX*i} {originymin + P23RSc_SEPY*j} {randzpos}

     end
end
