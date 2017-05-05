// genesis

// Arranging the P6RSa cells in space.

echo Creating P6RSa network

//float	P6RSa_SEPX = 25e-6
//float	P6RSa_SEPY = 25e-6
//float	P6RSa_NX = 5
//float	P6RSa_NY = 5

float originxmin
float originymin

// Unique number for each cell type (same as spike number)
int typenum = 11
str typename = "P6RSa"

int ydex
float placer

float randzpos
int i,j
int k = 0

placer = {mynode}/{sqrtNnodes}

//echo placer= {placer}

ydex = { round {placer} }

//echo ydex= {ydex}

originxmin = {regionoffsetx}+({mynode}-{ydex}*sqrtNnodes)*P6RSa_NX*P6RSa_SEPX

//echo originxmin= {originxmin}

originymin = {regionoffsety}+{ydex}*P6RSa_NY*P6RSa_SEPY

//echo originymin= {originymin}

create neutral /P6RSanet

// Random orientation
float randrotation
addfield /P6RSa rotation

if ({{{output} == 1} & {{membranepotentialoutput} == 1}})
     create asc_file /Vmwrite{typenum}
     setfield /Vmwrite{typenum} filename ./data-latest/membrane.{typename}.{myzeropadnode} flush 1 leave_open 1 append 0 float_format %0.9g
end

// CREATING THE PLANE OF P6RSa cells
//createmap /P6RSa /P6RSanet  \
//	{P6RSa_NX} {P6RSa_NY} \
//	-delta {P6RSa_SEPX} {P6RSa_SEPY} \
//	-origin {originxmin} {originymin}

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

for (j = 0; j < P6RSa_NY; j = j+1)
     for (i = 0; i < P6RSa_NX; i = i+1)

          int newrandseed = {{ {typenum} @0@ {trunc {{{originxmin}+{P6RSa_SEPX}*{i}}/{SEPX}}} @0@ {trunc {{{originymin}+{P6RSa_SEPY}*{j}}/{SEPY}}} } + {myrandseed}}
          randseed {newrandseed}
          randzpos = { rand 0 550e-6 }

          copy /P6RSa /P6RSanet/P6RSa[{k}]
          position /P6RSanet/P6RSa[{k}] \
            {originxmin + P6RSa_SEPX*i} {originymin + P6RSa_SEPY*j} {randzpos}

          // Rotate about z-axis ("twirl" in GENESIS cellsheet terminology)
          if ({rotateneurons} == 1)
              randrotation = {rand 0 6.283185308 }
              setfield /P6RSanet/P6RSa[{k}] rotation {randrotation} // save for posterity
              rotcoord /P6RSanet/P6RSa[{k}] {randrotation} -z -center {originxmin + P6RSa_SEPX*i} {originymin + P6RSa_SEPY*j} {randzpos}
          end

          if ({{{output} == 1} & {{membranepotentialoutput} == 1}})
               addmsg /P6RSanet/P6RSa[{k}]/soma /Vmwrite{typenum} SAVE Vm
          end

          k=k+1

          echo Position P6RSa {mynode} {myregion} {i} {j} {originxmin} {originymin} {originxmin + P6RSa_SEPX*i} {originymin + P6RSa_SEPY*j} {randzpos} {randrotation}

     end
end
