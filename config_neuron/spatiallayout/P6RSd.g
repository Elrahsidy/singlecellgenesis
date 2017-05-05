// genesis

// Arranging the P6RSd cells in space.

echo Creating P6RSd network

//float	P6RSd_SEPX = 25e-6
//float	P6RSd_SEPY = 25e-6
//float	P6RSd_NX = 5
//float	P6RSd_NY = 5

float originxmin
float originymin

// Unique number for each cell type (same as spike number)
int typenum = 14
str typename = "P6RSd"

int ydex
float placer

float randzpos
int i,j
int k = 0

placer = {mynode}/{sqrtNnodes}

//echo placer= {placer}

ydex = { round {placer} }

//echo ydex= {ydex}

originxmin = {regionoffsetx}+({mynode}-{ydex}*sqrtNnodes)*P6RSd_NX*P6RSd_SEPX

//echo originxmin= {originxmin}

originymin = {regionoffsety}+{ydex}*P6RSd_NY*P6RSd_SEPY

//echo originymin= {originymin}

create neutral /P6RSdnet

// Random orientation
float randrotation
addfield /P6RSd rotation

if ({{{output} == 1} & {{membranepotentialoutput} == 1}})
     create asc_file /Vmwrite{typenum}
     setfield /Vmwrite{typenum} filename ./data-latest/membrane.{typename}.{myzeropadnode} flush 1 leave_open 1 append 0 float_format %0.9g
end

// CREATING THE PLANE OF P6RSd cells
//createmap /P6RSd /P6RSdnet  \
//	{P6RSd_NX} {P6RSd_NY} \
//	-delta {P6RSd_SEPX} {P6RSd_SEPY} \
//	-origin {originxmin} {originymin}

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

for (j = 0; j < P6RSd_NY; j = j+1)
     for (i = 0; i < P6RSd_NX; i = i+1)

          int newrandseed = {{ {typenum} @0@ {trunc {{{originxmin}+{P6RSd_SEPX}*{i}}/{SEPX}}} @0@ {trunc {{{originymin}+{P6RSd_SEPY}*{j}}/{SEPY}}} } + {myrandseed}}
          randseed {newrandseed}
          randzpos = { rand 0 550e-6 }

          copy /P6RSd /P6RSdnet/P6RSd[{k}]
          position /P6RSdnet/P6RSd[{k}] \
            {originxmin + P6RSd_SEPX*i} {originymin + P6RSd_SEPY*j} {randzpos}

          // Rotate about z-axis ("twirl" in GENESIS cellsheet terminology)
          if ({rotateneurons} == 1)
              randrotation = {rand 0 6.283185308 }
              setfield /P6RSdnet/P6RSd[{k}] rotation {randrotation} // save for posterity
              rotcoord /P6RSdnet/P6RSd[{k}] {randrotation} -z -center {originxmin + P6RSd_SEPX*i} {originymin + P6RSd_SEPY*j} {randzpos}
          end

          if ({{{output} == 1} & {{membranepotentialoutput} == 1}})
               addmsg /P6RSdnet/P6RSd[{k}]/soma /Vmwrite{typenum} SAVE Vm
          end

          k=k+1

          echo Position P6RSd {mynode} {myregion} {i} {j} {originxmin} {originymin} {originxmin + P6RSd_SEPX*i} {originymin + P6RSd_SEPY*j} {randzpos} {randrotation}

     end
end
