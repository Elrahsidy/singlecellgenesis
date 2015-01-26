// genesis

// Arranging the P5IBb cells in space.

echo Creating P5IBb network

//float	P5IBb_SEPX = 25e-6
//float	P5IBb_SEPY = 25e-6
//float	P5IBb_NX = 5
//float	P5IBb_NY = 5

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

originxmin = ({mynode}-{ydex}*sqrtNnodes)*P5IBb_NX*P5IBb_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*P5IBb_NY*P5IBb_SEPY

//echo originymin= {originymin}

create neutral /P5IBbnet

// CREATING THE PLANE OF P5IBb cells
//createmap /P5IBb /P5IBbnet  \
//	{P5IBb_NX} {P5IBb_NY} \
//	-delta {P5IBb_SEPX} {P5IBb_SEPY} \
//	-origin {originxmin} {originymin}

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

for (j = 0; j < P5IBb_NY; j = j+1)
     for (i = 0; i < P5IBb_NX; i = i+1)

          randzpos = { rand 550e-6 1262e-6 }

          copy /P5IBb /P5IBbnet/P5IBb[{k}]
          position /P5IBbnet/P5IBb[{k}] \
            {originxmin + P5IBb_SEPX*i} {originymin + P5IBb_SEPY*j} {randzpos}
          k=k+1

          echo Position P5IBb {mynode} {i} {j} {originxmin} {originymin} {originxmin + P5IBb_SEPX*i} {originymin + P5IBb_SEPY*j} {randzpos}

     end
end
