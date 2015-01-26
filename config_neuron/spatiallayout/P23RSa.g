// genesis

// Arranging the P23RSa cells in space.

echo Creating P23RSa network

//float	P23RSa_SEPX = 25e-6
//float	P23RSa_SEPY = 25e-6
//float	P23RSa_NX = 5
//float	P23RSa_NY = 5

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

originxmin = ({mynode}-{ydex}*sqrtNnodes)*P23RSa_NX*P23RSa_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*P23RSa_NY*P23RSa_SEPY

//echo originymin= {originymin}

create neutral /P23RSanet

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

for (j = 0; j < P23RSa_NY; j = j+1)
     for (i = 0; i < P23RSa_NX; i = i+1)

          randzpos = { rand 1602e-6 2871e-6 }

          copy /P23RSa /P23RSanet/P23RSa[{k}]
          position /P23RSanet/P23RSa[{k}] \
            {originxmin + P23RSa_SEPX*i} {originymin + P23RSa_SEPY*j} {randzpos}
          k=k+1

          echo Position P23RSa {mynode} {i} {j} {originxmin} {originymin} {originxmin + P23RSa_SEPX*i} {originymin + P23RSa_SEPY*j} {randzpos}

     end
end
