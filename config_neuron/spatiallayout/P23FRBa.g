// genesis

// Arranging the P23FRBa cells in space.

echo Creating P23FRBa network

//float	P23FRBa_SEPX = 25e-6
//float	P23FRBa_SEPY = 25e-6
//float	P23FRBa_NX = 5
//float	P23FRBa_NY = 5

float originxmin
float originymin

int ydex
float placer

float randzpos
int i,j
int k = 0

placer = {mynode}/{sqrtNnodes}

//echo placer= {placer}

ydex = { round {placer} }

//echo ydex= {ydex}

originxmin = ({mynode}-{ydex}*sqrtNnodes)*P23FRBa_NX*P23FRBa_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*P23FRBa_NY*P23FRBa_SEPY

//echo originymin= {originymin}

create neutral /P23FRBanet

// CREATING THE PLANE OF P23FRBa cells
//createmap /P23FRBa /P23FRBanet  \
//	{P23FRBa_NX} {P23FRBa_NY} \
//	-delta {P23FRBa_SEPX} {P23FRBa_SEPY} \
//	-origin {originxmin} {originymin}

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

for (j = 0; j < P23FRBa_NY; j = j+1)
     for (i = 0; i < P23FRBa_NX; i = i+1)

          randzpos = { rand 1602e-6 2871e-6 }

          copy /P23FRBa /P23FRBanet/P23FRBa[{k}]
          position /P23FRBanet/P23FRBa[{k}] \
            {originxmin + P23FRBa_SEPX*i} {originymin + P23FRBa_SEPY*j} {randzpos}
          k=k+1

          echo Position P23FRBa {mynode} {i} {j} {originxmin} {originymin} {originxmin + P23FRBa_SEPX*i} {originymin + P23FRBa_SEPY*j} {randzpos}

     end
end
