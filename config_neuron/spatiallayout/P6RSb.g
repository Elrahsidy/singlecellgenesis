// genesis

// Arranging the P6RSb cells in space.

echo Creating P6RSb network

//float	P6RSb_SEPX = 25e-6
//float	P6RSb_SEPY = 25e-6
//float	P6RSb_NX = 5
//float	P6RSb_NY = 5

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

originxmin = ({mynode}-{ydex}*sqrtNnodes)*P6RSb_NX*P6RSb_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*P6RSb_NY*P6RSb_SEPY

//echo originymin= {originymin}

create neutral /P6RSbnet

// CREATING THE PLANE OF P6RSb cells
//createmap /P6RSb /P6RSbnet  \
//	{P6RSb_NX} {P6RSb_NY} \
//	-delta {P6RSb_SEPX} {P6RSb_SEPY} \
//	-origin {originxmin} {originymin}

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

for (j = 0; j < P6RSb_NY; j = j+1)
     for (i = 0; i < P6RSb_NX; i = i+1)

          randzpos = { rand 0 550e-6 }

          copy /P6RSb /P6RSbnet/P6RSb[{k}]
          position /P6RSbnet/P6RSb[{k}] \
            {originxmin + P6RSb_SEPX*i} {originymin + P6RSb_SEPY*j} {randzpos}
          k=k+1

          echo Position P6RSb {mynode} {i} {j} {originxmin} {originymin} {originxmin + P6RSb_SEPX*i} {originymin + P6RSb_SEPY*j} {randzpos}

     end
end
