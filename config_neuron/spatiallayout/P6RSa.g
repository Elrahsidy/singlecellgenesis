// genesis

// Arranging the P6RSa cells in space.

echo Creating P6RSa network

//float	P6RSa_SEPX = 25e-6
//float	P6RSa_SEPY = 25e-6
//float	P6RSa_NX = 5
//float	P6RSa_NY = 5

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

originxmin = ({mynode}-{ydex}*sqrtNnodes)*P6RSa_NX*P6RSa_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*P6RSa_NY*P6RSa_SEPY

//echo originymin= {originymin}

create neutral /P6RSanet

// CREATING THE PLANE OF P6RSa cells
//createmap /P6RSa /P6RSanet  \
//	{P6RSa_NX} {P6RSa_NY} \
//	-delta {P6RSa_SEPX} {P6RSa_SEPY} \
//	-origin {originxmin} {originymin}

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

for (j = 0; j < P6RSa_NY; j = j+1)
     for (i = 0; i < P6RSa_NX; i = i+1)

          randzpos = { rand 0 550e-6 }

          copy /P6RSa /P6RSanet/P6RSa[{k}]
          position /P6RSanet/P6RSa[{k}] \
            {originxmin + P6RSa_SEPX*i} {originymin + P6RSa_SEPY*j} {randzpos}
          k=k+1

          echo Position P6RSa {mynode} {i} {j} {originxmin} {originymin} {originxmin + P6RSa_SEPX*i} {originymin + P6RSa_SEPY*j} {randzpos}

     end
end
