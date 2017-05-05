// genesis

// Arranging the P23RSa cells in space.

echo Creating P23RSa network

//float	P23RSa_SEPX = 25e-6
//float	P23RSa_SEPY = 25e-6
//float	P23RSa_NX = 5
//float	P23RSa_NY = 5

float originxmin
float originymin

// Unique number for each cell type (same as spike number)
int typenum = 1
str typename = "P23RSa"

int ydex
float placer

float randzpos
int i,j
int k = 0

placer = {mynode}/{sqrtNnodes}

//echo placer= {placer}

ydex = { round {placer} }

//echo ydex= {ydex}

originxmin = {regionoffsetx}+({mynode}-{ydex}*sqrtNnodes)*P23RSa_NX*P23RSa_SEPX

//echo originxmin= {originxmin}

originymin = {regionoffsety}+{ydex}*P23RSa_NY*P23RSa_SEPY

//echo originymin= {originymin}

create neutral /P23RSanet

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

// Random orientation
float randrotation
addfield /P23RSa rotation

if ({{{output} == 1} & {{membranepotentialoutput} == 1}})
     create asc_file /Vmwrite{typenum}
     setfield /Vmwrite{typenum} filename ./data-latest/membrane.{typename}.{myzeropadnode} flush 1 leave_open 1 append 0 float_format %0.9g
end

for (j = 0; j < P23RSa_NY; j = j+1)
     for (i = 0; i < P23RSa_NX; i = i+1)

          int newrandseed = {{ {typenum} @0@ {trunc {{{originxmin}+{P23RSa_SEPX}*{i}}/{SEPX}}} @0@ {trunc {{{originymin}+{P23RSa_SEPY}*{j}}/{SEPY}}} } + {myrandseed}}
          randseed {newrandseed}
          randzpos = { rand 1602e-6 2871e-6 }

          copy /P23RSa /P23RSanet/P23RSa[{k}]
          position /P23RSanet/P23RSa[{k}] \
            {originxmin + P23RSa_SEPX*i} {originymin + P23RSa_SEPY*j} {randzpos}

          // Rotate about z-axis ("twirl" in GENESIS cellsheet terminology)
          if ({rotateneurons} == 1)
              randrotation = { rand 0 6.283185308 }
              setfield /P23RSanet/P23RSa[{k}] rotation {randrotation} // save for posterity
              rotcoord /P23RSanet/P23RSa[{k}] {randrotation} -z -center {originxmin + P23RSa_SEPX*i} {originymin + P23RSa_SEPY*j} {randzpos}
          end

          if ({{{output} == 1} & {{membranepotentialoutput} == 1}})
               addmsg /P23RSanet/P23RSa[{k}]/soma /Vmwrite{typenum} SAVE Vm
          end

          k=k+1

          echo Position P23RSa {mynode} {myregion} {i} {j} {originxmin} {originymin} {originxmin + P23RSa_SEPX*i} {originymin + P23RSa_SEPY*j} {randzpos} {randrotation}

     end
end
