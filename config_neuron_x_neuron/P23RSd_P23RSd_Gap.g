// genesis

// Setting the Resistance of the Gap Junction (1/conductance)
float Rgap = 3.0e9	// Ohms (1/Mhos) from Traub 2005 paper

//float	P23RSd_SEPX = 25e-6
//float	P23RSd_SEPY = 25e-6
//float	P23RSd_NX = 5
//float	P23RSd_NY = 5

int i,j,dexN,dexE,dexS,dexW
int conn1dex, conn2dex
float test1, test2
str conn1loc="", conn2loc=""
float globalconnprob=0.0056 //after Traub 2005
float randconn
int jnodedex,inodedex,jnodecalc

echo P23RSd - P23RSd Gap Junctions

for (i=0;i<=(P23RSd_NY-1);i=i+1)
    for (j=0;j<=(P23RSd_NX-1);j=j+1)

        dexN=i-1
        dexE=j+1
        dexS=i+1
        dexW=j-1

        // N
        randconn = { rand 0 1.0 }

        if ({dexN>=0} && {randconn<{globalconnprob}})
            conn1dex=i*P23RSd_NX+j
            conn2dex=(i-1)*P23RSd_NX+j

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc}  RAXIAL {Rgap} Vm
            addmsg /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        if ({dexN==-1} && {randconn<{globalconnprob}} && { {mynode} >= {sqrtNnodes} }) //for nodal edge
            conn1dex=i*P23RSd_NX+j
            conn2dex=(P23RSd_NY-1)*P23RSd_NX+j

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes}} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // NE
        randconn = { rand 0 1.0 }

        if ({dexN>=0} && {dexE<P23RSd_NX} && {randconn<{globalconnprob}})
            conn1dex=i*P23RSd_NX+j
            conn2dex=(i-1)*P23RSd_NX+j+1

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexN==-1} && {randconn<{globalconnprob}} && {dexE<P23RSd_NX} && { {mynode} >= {sqrtNnodes} }) //for nodal edge
            conn1dex=i*P23RSd_NX+j
            conn2dex=(P23RSd_NY-1)*P23RSd_NX+j+1

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes}} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        if ({dexN==-1} && {randconn<{globalconnprob}} && {dexE==P23RSd_NX} && { {mynode} >= {sqrtNnodes} } && {jnodedex} < {sqrtNnodes-1}) //for nodal edge corner

            conn1dex=i*P23RSd_NX+j
            conn2dex=(P23RSd_NY-1)*P23RSd_NX

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes} + 1} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes} - 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE==P23RSd_NX} && {dexN>-1} && {randconn<{globalconnprob}} &&{ {jnodedex} < {sqrtNnodes-1} } ) //for nodal edge

            conn1dex=i*P23RSd_NX+j
            conn2dex=(i-1)*P23RSd_NX

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc}@{{mynode} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + 1} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc}@{{mynode} - 1} RAXIAL {Rgap} Vm

        end

        // E
        randconn = { rand 0 1.0 }

        if ({dexE<P23RSd_NX} && {randconn<{globalconnprob}})
            conn1dex=i*P23RSd_NX+j
            conn2dex=(i)*P23RSd_NX+j+1

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexE==P23RSd_NX} && {randconn<{globalconnprob}} && { {jnodedex} < {sqrtNnodes-1} }) //for nodal edge

            conn1dex=i*P23RSd_NX+j
            conn2dex=i*P23RSd_NX

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc}@{{mynode} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + 1} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc}@{{mynode} - 1} RAXIAL {Rgap} Vm

        end

        // SE
        randconn = { rand 0 1.0 }

        if ({dexE<P23RSd_NX} && {dexS>P23RSd_NY} && {randconn<{globalconnprob}})

            conn1dex=i*P23RSd_NX+j
            conn2dex=(i+1)*P23RSd_NX+j+1

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexE==P23RSd_NX} && {randconn<{globalconnprob}} && {dexS<P23RSd_NY} && { {jnodedex} < {sqrtNnodes-1} }) //for nodal edge

            conn1dex=i*P23RSd_NX+j
            conn2dex=(i+1)*P23RSd_NX

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc}@{{mynode} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + 1} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc}@{{mynode} - 1} RAXIAL {Rgap} Vm

        end

        if ({dexS==P23RSd_NY} && {randconn<{globalconnprob}} && {dexE==P23RSd_NX} && { {jnodedex} < {sqrtNnodes-1} }) //for nodal edge corner

            conn1dex=i*P23RSd_NX+j
            conn2dex=0

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes} +1} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes} - 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE<P23RSd_NX} && {dexS==P23RSd_NY} && {randconn<{globalconnprob}} &&{ {mynode} < {{sqrtNnodes}*{sqrtNnodes-1}} } ) //for nodal edge

            conn1dex=i*P23RSd_NX+j
            conn2dex=(j+1)

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes}} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // S
        randconn = { rand 0 1.0 }

        if ({dexS<P23RSd_NY} && {randconn<{globalconnprob}})
            conn1dex=i*P23RSd_NX+j
            conn2dex=(i+1)*P23RSd_NX+j

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        if ({dexS==P23RSd_NY} && {randconn<{globalconnprob}} && { {mynode} >= {sqrtNnodes}*{sqrtNnodes-1} }) //for nodal edge
            conn1dex=i*P23RSd_NX+j
            conn2dex=j

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes}} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // SW
        randconn = { rand 0 1.0 }

        if ({dexS<P23RSd_NY} && {dexW>=0} && {randconn<{globalconnprob}})
            conn1dex=i*P23RSd_NX+j
            conn2dex=(i+1)*P23RSd_NX+j-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexE==1} && {randconn<{globalconnprob}} && {dexS<P23RSd_NY} && { {jnodedex} > 0 }) //for nodal edge

            conn1dex=i*P23RSd_NX+j
            conn2dex=(i+2)*P23RSd_NX-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc}@{{mynode} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - 1} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc}@{{mynode} + 1} RAXIAL {Rgap} Vm

        end

        if ({dexS==P23RSd_NY} && {randconn<{globalconnprob}} && {dexE==1} && { {jnodedex} > 0 }) //for nodal edge corner

            conn1dex=i*P23RSd_NX+j
            conn2dex=P23RSd_NX-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes} - 1} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes} + 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE>1} && {dexS==P23RSd_NY} && {randconn<{globalconnprob}} &&{ {mynode} < {{sqrtNnodes}*{sqrtNnodes-1}} } ) //for nodal edge

            conn1dex=i*P23RSd_NX+j
            conn2dex=(j-1)

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes}} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // W
        randconn = { rand 0 1.0 }

        if ({dexW>=0} && {randconn<{globalconnprob}})
            conn1dex=i*P23RSd_NX+j
            conn2dex=(i)*P23RSd_NX+j-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexW==-1} && {randconn<{globalconnprob}} && { {jnodedex} > 0 }) //for nodal edge
            conn1dex=i*P23RSd_NX+j
            conn2dex=(i+1)*P23RSd_NX-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc}@{{mynode} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - 1} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc}@{{mynode} + 1} RAXIAL {Rgap} Vm

        end

        // NW
        randconn = { rand 0 1.0 }

        if ({dexW>=0} && {dexN>=0} && {randconn<{globalconnprob}})
            conn1dex=i*P23RSd_NX+j
            conn2dex=(i-1)*P23RSd_NX+j-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm
        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexN==-1} && {randconn<{globalconnprob}} && {dexE>1} && { {mynode} >= {sqrtNnodes} }) //for nodal edge

            conn1dex=i*P23RSd_NX+j
            conn2dex=(P23RSd_NY-1)*P23RSd_NX+j-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes}} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        if ({dexN==-1} && {randconn<{globalconnprob}} && {dexE==1} && { {mynode} >= {sqrtNnodes} } && { {jnodedex} > 0 }) //for nodal edge corner

            conn1dex=i*P23RSd_NX+j
            conn2dex=(P23RSd_NY*P23RSd_NX)-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes} - 1} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes} + 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE==1} && {dexN>-1} && {randconn<{globalconnprob}} && { {jnodedex} > 0 } ) //for nodal edge

            conn1dex=i*P23RSd_NX+j
            conn2dex=(i)*P23RSd_NX-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc}@{{mynode} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - 1} /P23RSdnet/P23RSd[{conn2dex}]/{conn2loc} /P23RSdnet/P23RSd[{conn1dex}]/{conn1loc}@{{mynode} + 1} RAXIAL {Rgap} Vm

        end

    end
end

