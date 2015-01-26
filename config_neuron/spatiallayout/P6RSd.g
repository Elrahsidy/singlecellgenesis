// genesis

// Arranging the P6RSd cells in space.

echo Creating P6RSd network

//float	P6RSd_SEPX = 25e-6
//float	P6RSd_SEPY = 25e-6
//float	P6RSd_NX = 5
//float	P6RSd_NY = 5

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

originxmin = ({mynode}-{ydex}*sqrtNnodes)*P6RSd_NX*P6RSd_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*P6RSd_NY*P6RSd_SEPY

//echo originymin= {originymin}

create neutral /P6RSdnet

// CREATING THE PLANE OF P6RSd cells
//createmap /P6RSd /P6RSdnet  \
//	{P6RSd_NX} {P6RSd_NY} \
//	-delta {P6RSd_SEPX} {P6RSd_SEPY} \
//	-origin {originxmin} {originymin}

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

for (j = 0; j < P6RSd_NY; j = j+1)
     for (i = 0; i < P6RSd_NX; i = i+1)

          randzpos = { rand 0 550e-6 }

          copy /P6RSd /P6RSdnet/P6RSd[{k}]
          position /P6RSdnet/P6RSd[{k}] \
            {originxmin + P6RSd_SEPX*i} {originymin + P6RSd_SEPY*j} {randzpos}
          k=k+1

          echo Position P6RSd {mynode} {i} {j} {originxmin} {originymin} {originxmin + P6RSd_SEPX*i} {originymin + P6RSd_SEPY*j} {randzpos}

     end
end
