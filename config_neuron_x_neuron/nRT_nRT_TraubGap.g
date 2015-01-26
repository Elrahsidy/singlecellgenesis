// genesis

// Setting the Resistance of the Gap Junction (1/conductance)
float Rgap = 1.0e9	// Ohms (1/Mhos) from Traub 2005 paper

//float	nRT_SEPX = 25e-6
//float	nRT_SEPY = 25e-6
//float	nRT_NX = 5
//float	nRT_NY = 5

int i,j,dexN,dexE,dexS,dexW
int conn1dex, conn2dex
float test1, test2
str conn1loc="", conn2loc=""
float globalconnprob=0.0781 //after Traub 2005
float randconn
int jnodedex,inodedex,jnodecalc

echo nRT - nRT TraubGap!!! Junctions

for (i=0;i<=(nRT_NY-1);i=i+1)
    for (j=0;j<=(nRT_NX/2-1);j=j+1)

        dexN=i-1
        dexE=j+1
        dexS=i+1
        dexW=j-1

        // N
        randconn = { rand 0 1.0 }

        if ({dexN>=0} && {randconn<{globalconnprob}})
            conn1dex=i*nRT_NX/2+j
            conn2dex=(i-1)*nRT_NX/2+j

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            addmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc}  RAXIAL {Rgap} Vm
            addmsg /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        if ({dexN==-1} && {randconn<{globalconnprob}} && { {mynode} >= {sqrtNnodes} }) //for nodal edge
            conn1dex=i*nRT_NX/2+j
            conn2dex=(nRT_NY-1)*nRT_NX/2+j

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes}} /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // NE
        randconn = { rand 0 1.0 }

        if ({dexN>=0} && {dexE<nRT_NX/2} && {randconn<{globalconnprob}})
            conn1dex=i*nRT_NX/2+j
            conn2dex=(i-1)*nRT_NX/2+j+1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            addmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexN==-1} && {randconn<{globalconnprob}} && {dexE<nRT_NX/2} && { {mynode} >= {sqrtNnodes} }) //for nodal edge
            conn1dex=i*nRT_NX/2+j
            conn2dex=(nRT_NY-1)*nRT_NX/2+j+1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes}} /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        if ({dexN==-1} && {randconn<{globalconnprob}} && {dexE==nRT_NX/2} && { {mynode} >= {sqrtNnodes} } && {jnodedex} < {sqrtNnodes-1}) //for nodal edge corner

            conn1dex=i*nRT_NX/2+j
            conn2dex=(nRT_NY-1)*nRT_NX/2

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes} + 1} /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes} - 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE==nRT_NX/2} && {dexN>-1} && {randconn<{globalconnprob}} &&{ {jnodedex} < {sqrtNnodes-1} } ) //for nodal edge

            conn1dex=i*nRT_NX/2+j
            conn2dex=(i-1)*nRT_NX/2

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc}@{{mynode} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + 1} /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc}@{{mynode} - 1} RAXIAL {Rgap} Vm

        end

        // E
        randconn = { rand 0 1.0 }

        if ({dexE<nRT_NX/2} && {randconn<{globalconnprob}})
            conn1dex=i*nRT_NX/2+j
            conn2dex=(i)*nRT_NX/2+j+1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            addmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexE==nRT_NX/2} && {randconn<{globalconnprob}} && { {jnodedex} < {sqrtNnodes-1} }) //for nodal edge

            conn1dex=i*nRT_NX/2+j
            conn2dex=i*nRT_NX/2

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc}@{{mynode} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + 1} /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc}@{{mynode} - 1} RAXIAL {Rgap} Vm

        end

        // SE
        randconn = { rand 0 1.0 }

        if ({dexE<nRT_NX/2} && {dexS>nRT_NY} && {randconn<{globalconnprob}})

            conn1dex=i*nRT_NX/2+j
            conn2dex=(i+1)*nRT_NX/2+j+1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            addmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexE==nRT_NX/2} && {randconn<{globalconnprob}} && {dexS<nRT_NY} && { {jnodedex} < {sqrtNnodes-1} }) //for nodal edge

            conn1dex=i*nRT_NX/2+j
            conn2dex=(i+1)*nRT_NX/2

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc}@{{mynode} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + 1} /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc}@{{mynode} - 1} RAXIAL {Rgap} Vm

        end

        if ({dexS==nRT_NY} && {randconn<{globalconnprob}} && {dexE==nRT_NX/2} && { {jnodedex} < {sqrtNnodes-1} }) //for nodal edge corner

            conn1dex=i*nRT_NX/2+j
            conn2dex=0

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes} + 1} /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes} - 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE<nRT_NX/2} && {dexS==nRT_NY} && {randconn<{globalconnprob}} &&{ {mynode} < {{sqrtNnodes}*{sqrtNnodes-1}} } ) //for nodal edge

            conn1dex=i*nRT_NX/2+j
            conn2dex=(j+1)

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes}} /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // S
        randconn = { rand 0 1.0 }

        if ({dexS<nRT_NY} && {randconn<{globalconnprob}})
            conn1dex=i*nRT_NX/2+j
            conn2dex=(i+1)*nRT_NX/2+j

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            addmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        if ({dexS==nRT_NY} && {randconn<{globalconnprob}} && { {mynode} >= {sqrtNnodes}*{sqrtNnodes-1} }) //for nodal edge
            conn1dex=i*nRT_NX/2+j
            conn2dex=j

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes}} /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // SW
        randconn = { rand 0 1.0 }

        if ({dexS<nRT_NY} && {dexW>=0} && {randconn<{globalconnprob}})
            conn1dex=i*nRT_NX/2+j
            conn2dex=(i+1)*nRT_NX/2+j-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            addmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexE==1} && {randconn<{globalconnprob}} && {dexS<nRT_NY} && { {jnodedex} > 0 }) //for nodal edge

            conn1dex=i*nRT_NX/2+j
            conn2dex=(i+2)*nRT_NX/2-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc}@{{mynode} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - 1} /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc}@{{mynode} + 1} RAXIAL {Rgap} Vm

        end

        if ({dexS==nRT_NY} && {randconn<{globalconnprob}} && {dexE==1} && { {jnodedex} > 0 }) //for nodal edge corner

            conn1dex=i*nRT_NX/2+j
            conn2dex=nRT_NX/2-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes} -1} /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes} + 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE>1} && {dexS==nRT_NY} && {randconn<{globalconnprob}} &&{ {mynode} < {{sqrtNnodes}*{sqrtNnodes-1}} } ) //for nodal edge

            conn1dex=i*nRT_NX/2+j
            conn2dex=(j-1)

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes}} /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // W
        randconn = { rand 0 1.0 }

        if ({dexW>=0} && {randconn<{globalconnprob}})
            conn1dex=i*nRT_NX/2+j
            conn2dex=(i)*nRT_NX/2+j-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            addmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexW==-1} && {randconn<{globalconnprob}} && { {jnodedex} > 0 }) //for nodal edge
            conn1dex=i*nRT_NX/2+j
            conn2dex=(i+1)*nRT_NX/2-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc}@{{mynode} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - 1} /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc}@{{mynode} + 1} RAXIAL {Rgap} Vm

        end

        // NW
        randconn = { rand 0 1.0 }

        if ({dexW>=0} && {dexN>=0} && {randconn<{globalconnprob}})
            conn1dex=i*nRT_NX/2+j
            conn2dex=(i-1)*nRT_NX/2+j-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            addmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm
        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexN==-1} && {randconn<{globalconnprob}} && {dexE>1} && { {mynode} >= {sqrtNnodes} }) //for nodal edge

            conn1dex=i*nRT_NX/2+j
            conn2dex=(nRT_NY-1)*nRT_NX/2+j-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes}} /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        if ({dexN==-1} && {randconn<{globalconnprob}} && {dexE==1} && { {mynode} >= {sqrtNnodes} } && { {jnodedex} > 0 }) //for nodal edge corner

            conn1dex=i*nRT_NX/2+j
            conn2dex=(nRT_NY*nRT_NX/2)-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes} - 1} /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes} + 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE==1} && {dexN>-1} && {randconn<{globalconnprob}} && { {jnodedex} > 0 } ) //for nodal edge

            conn1dex=i*nRT_NX/2+j
            conn2dex=(i)*nRT_NX/2-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /nRTnet/nRT[{conn1dex}]/{conn1loc} /nRTnet/nRT[{conn2dex}]/{conn2loc}@{{mynode} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - 1} /nRTnet/nRT[{conn2dex}]/{conn2loc} /nRTnet/nRT[{conn1dex}]/{conn1loc}@{{mynode} + 1} RAXIAL {Rgap} Vm

        end

    end
end

