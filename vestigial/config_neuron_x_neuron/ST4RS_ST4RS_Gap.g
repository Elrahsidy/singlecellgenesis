// genesis

// Setting the Resistance of the Gap Junction (1/conductance)
float Rgap = 3.0e9	// Ohms (1/Mhos) from Traub 2005 paper

//float	ST4RS_SEPX = 25e-6
//float	ST4RS_SEPY = 25e-6
//float	ST4RS_NX = 5
//float	ST4RS_NY = 5

int i,j,dexN,dexE,dexS,dexW
int conn1dex, conn2dex
float test1, test2
str conn1loc="", conn2loc=""
float globalconnprob=0.0312 //after Traub 2005
float randconn
int jnodedex,inodedex,jnodecalc

echo ST4RS - ST4RS Gap Junctions

for (i=0;i<=(ST4RS_NY-1);i=i+1)
    for (j=0;j<=(ST4RS_NX-1);j=j+1)

        dexN=i-1
        dexE=j+1
        dexS=i+1
        dexW=j-1

        // N
        randconn = { rand 0 1.0 }

        if ({dexN>=0} && {randconn<{globalconnprob}})
            conn1dex=i*ST4RS_NX+j
            conn2dex=(i-1)*ST4RS_NX+j

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc}  RAXIAL {Rgap} Vm
            addmsg /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        if ({dexN==-1} && {randconn<{globalconnprob}} && { {mynode} >= {sqrtNnodes} }) //for nodal edge
            conn1dex=i*ST4RS_NX+j
            conn2dex=(ST4RS_NY-1)*ST4RS_NX+j

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes}} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // NE
        randconn = { rand 0 1.0 }

        if ({dexN>=0} && {dexE<ST4RS_NX} && {randconn<{globalconnprob}})
            conn1dex=i*ST4RS_NX+j
            conn2dex=(i-1)*ST4RS_NX+j+1

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexN==-1} && {randconn<{globalconnprob}} && {dexE<ST4RS_NX} && { {mynode} >= {sqrtNnodes} }) //for nodal edge
            conn1dex=i*ST4RS_NX+j
            conn2dex=(ST4RS_NY-1)*ST4RS_NX+j+1

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes}} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        if ({dexN==-1} && {randconn<{globalconnprob}} && {dexE==ST4RS_NX} && { {mynode} >= {sqrtNnodes} } && {jnodedex} < {sqrtNnodes-1}) //for nodal edge corner

            conn1dex=i*ST4RS_NX+j
            conn2dex=(ST4RS_NY-1)*ST4RS_NX

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes} + 1} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes} - 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE==ST4RS_NX} && {dexN>-1} && {randconn<{globalconnprob}} &&{ {jnodedex} < {sqrtNnodes-1} } ) //for nodal edge

            conn1dex=i*ST4RS_NX+j
            conn2dex=(i-1)*ST4RS_NX

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc}@{{mynode} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + 1} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc}@{{mynode} - 1} RAXIAL {Rgap} Vm

        end

        // E
        randconn = { rand 0 1.0 }

        if ({dexE<ST4RS_NX} && {randconn<{globalconnprob}})
            conn1dex=i*ST4RS_NX+j
            conn2dex=(i)*ST4RS_NX+j+1

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexE==ST4RS_NX} && {randconn<{globalconnprob}} && { {jnodedex} < {sqrtNnodes-1} }) //for nodal edge

            conn1dex=i*ST4RS_NX+j
            conn2dex=i*ST4RS_NX

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc}@{{mynode} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + 1} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc}@{{mynode} - 1} RAXIAL {Rgap} Vm

        end

        // SE
        randconn = { rand 0 1.0 }

        if ({dexE<ST4RS_NX} && {dexS>ST4RS_NY} && {randconn<{globalconnprob}})

            conn1dex=i*ST4RS_NX+j
            conn2dex=(i+1)*ST4RS_NX+j+1

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexE==ST4RS_NX} && {randconn<{globalconnprob}} && {dexS<ST4RS_NY} && { {jnodedex} < {sqrtNnodes-1} }) //for nodal edge

            conn1dex=i*ST4RS_NX+j
            conn2dex=(i+1)*ST4RS_NX

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc}@{{mynode} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + 1} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc}@{{mynode} - 1} RAXIAL {Rgap} Vm

        end

        if ({dexS==ST4RS_NY} && {randconn<{globalconnprob}} && {dexE==ST4RS_NX} && { {jnodedex} < {sqrtNnodes-1} }) //for nodal edge corner

            conn1dex=i*ST4RS_NX+j
            conn2dex=0

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes} + 1} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes} - 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE<ST4RS_NX} && {dexS==ST4RS_NY} && {randconn<{globalconnprob}} &&{ {mynode} < {{sqrtNnodes}*{sqrtNnodes-1}} } ) //for nodal edge

            conn1dex=i*ST4RS_NX+j
            conn2dex=(j+1)

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes}} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // S
        randconn = { rand 0 1.0 }

        if ({dexS<ST4RS_NY} && {randconn<{globalconnprob}})
            conn1dex=i*ST4RS_NX+j
            conn2dex=(i+1)*ST4RS_NX+j

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        if ({dexS==ST4RS_NY} && {randconn<{globalconnprob}} && { {mynode} >= {sqrtNnodes}*{sqrtNnodes-1} }) //for nodal edge
            conn1dex=i*ST4RS_NX+j
            conn2dex=j

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes}} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // SW
        randconn = { rand 0 1.0 }

        if ({dexS<ST4RS_NY} && {dexW>=0} && {randconn<{globalconnprob}})
            conn1dex=i*ST4RS_NX+j
            conn2dex=(i+1)*ST4RS_NX+j-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexE==1} && {randconn<{globalconnprob}} && {dexS<ST4RS_NY} && { {jnodedex} > 0 }) //for nodal edge

            conn1dex=i*ST4RS_NX+j
            conn2dex=(i+2)*ST4RS_NX-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc}@{{mynode} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - 1} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc}@{{mynode} - 1} RAXIAL {Rgap} Vm

        end

        if ({dexS==ST4RS_NY} && {randconn<{globalconnprob}} && {dexE==1} && { {jnodedex} > 0 }) //for nodal edge corner

            conn1dex=i*ST4RS_NX+j
            conn2dex=ST4RS_NX-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes} - 1} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes} + 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE>1} && {dexS==ST4RS_NY} && {randconn<{globalconnprob}} &&{ {mynode} < {{sqrtNnodes}*{sqrtNnodes-1}} } ) //for nodal edge

            conn1dex=i*ST4RS_NX+j
            conn2dex=(j-1)

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes}} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // W
        randconn = { rand 0 1.0 }

        if ({dexW>=0} && {randconn<{globalconnprob}})
            conn1dex=i*ST4RS_NX+j
            conn2dex=(i)*ST4RS_NX+j-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexW==-1} && {randconn<{globalconnprob}} && { {jnodedex} > 0 }) //for nodal edge
            conn1dex=i*ST4RS_NX+j
            conn2dex=(i+1)*ST4RS_NX-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc}@{{mynode} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - 1} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc}@{{mynode} + 1} RAXIAL {Rgap} Vm

        end

        // NW
        randconn = { rand 0 1.0 }

        if ({dexW>=0} && {dexN>=0} && {randconn<{globalconnprob}})
            conn1dex=i*ST4RS_NX+j
            conn2dex=(i-1)*ST4RS_NX+j-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm
        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexN==-1} && {randconn<{globalconnprob}} && {dexE>1} && { {mynode} >= {sqrtNnodes} }) //for nodal edge

            conn1dex=i*ST4RS_NX+j
            conn2dex=(ST4RS_NY-1)*ST4RS_NX+j-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes}} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        if ({dexN==-1} && {randconn<{globalconnprob}} && {dexE==1} && { {mynode} >= {sqrtNnodes} } && { {jnodedex} > 0 }) //for nodal edge corner

            conn1dex=i*ST4RS_NX+j
            conn2dex=(ST4RS_NY*ST4RS_NX)-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes} - 1} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes} + 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE==1} && {dexN>-1} && {randconn<{globalconnprob}} && { {jnodedex} > 0 } ) //for nodal edge

            conn1dex=i*ST4RS_NX+j
            conn2dex=(i)*ST4RS_NX-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc}@{{mynode} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - 1} /ST4RSnet/ST4RS[{conn2dex}]/{conn2loc} /ST4RSnet/ST4RS[{conn1dex}]/{conn1loc}@{{mynode} + 1} RAXIAL {Rgap} Vm

        end

    end
end

