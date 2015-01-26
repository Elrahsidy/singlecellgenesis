// genesis

// Setting the Resistance of the Gap Junction (1/conductance)
float Rgap = 3.0e9	// Ohms (1/Mhos) from Traub 2005 paper

//float	P23RSc_SEPX = 25e-6
//float	P23RSc_SEPY = 25e-6
//float	P23RSc_NX = 5
//float	P23RSc_NY = 5

int i,j,dexN,dexE,dexS,dexW
int conn1dex, conn2dex
float test1, test2
str conn1loc="", conn2loc=""
float globalconnprob=0.0234 //after Traub 2005
float randconn
int jnodedex,inodedex,jnodecalc
int jdexcalc, jtest1, jtest2, jtest3, itest1, itest2

echo P23RSc - P23FRBa Gap Junctions

for (i=0;i<=(P23RSc_NY-1);i=i+1)
    for (j=0;j<=(P23RSc_NX-1);j=j+1)

        dexN=i-1
        dexE=j+1
        dexS=i+1
        dexW=j-1

        // N
        randconn = { rand 0 1.0 }

        if ({dexN >= 0} && {randconn < {globalconnprob}})

           conn1dex=i*P23RSc_NX+j
           conn2dex=(i-1)*P23RSc_NX+j

           float itest1arg = (i/2)

           itest1 = {trunc {itest1arg} }

           itest2 = {i} - 2*{itest1}

           if ({itest2==0})

               float conn2dexarg = conn2dex/2

               conn2dex = {trunc {conn2dexarg} } -(i/2)*P23FRBa_NX
                
           end

           if ({itest2==1})

               float conn2dexarg = conn2dex/2

               conn2dex = {trunc {conn2dexarg} }-((i-1)/2)*P23FRBa_NX

           end

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc}  RAXIAL {Rgap} Vm
            addmsg /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        if ({dexN == -1} && {randconn < {globalconnprob}} && { {mynode} >= {sqrtNnodes} }) //for nodal edge

            conn1dex=i*P23RSc_NX+j
            conn2dex=(P23RSc_NY-1)*P23RSc_NX + j

            float truncarg = j/2

            conn2dex = (P23FRBa_NY-1)*P23FRBa_NX + {trunc {truncarg} }

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes}} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // NE
        randconn = { rand 0 1.0 }

        if ({dexN >= 0} && {dexE < (P23RSc_NX-1)} && {randconn < {globalconnprob}})

            conn1dex=i*P23RSc_NX+j
            conn2dex=(i-1)*P23RSc_NX+j+1

            float itest1arg = (i/2)

            itest1 = {trunc {itest1arg} }

            itest2 = {i} - 2*{itest1}

            float jtest1arg = (j/2)

            jtest1 = {trunc {jtest1arg} }

            jtest2 = {j}  - 2*{jtest1}

            if ({itest2==0})

                 if ({jtest2==0})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-(i/2)*P23FRBa_NX+1
                           
                 end

                 if ({jtest2==1})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-(i/2)*P23FRBa_NX

                 end

            end

            if ({itest2==1})

                 if ({jtest2==0})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-((i-1)/2)*P23FRBa_NX+1

                 end

                 if ({jtest2==1})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-((i-1)/2)*P23FRBa_NX

                 end

            end

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/sqrtNnodes

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexN == -1} && {randconn < {globalconnprob}} && {dexE < (P23RSc_NX-1)} && { {mynode} >= {sqrtNnodes} }) //for nodal edge
 
            conn1dex=i*P23RSc_NX+j
            conn2dex=(P23RSc_NY-1)*P23RSc_NX+j+1

            float truncarg = j/2

            conn2dex = (P23FRBa_NY-1)*P23FRBa_NX + {trunc {truncarg} } + 1

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes}} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        if ({dexN == -1} && {randconn < {globalconnprob}} && {dexE >= P23RSc_NX-1} && { {mynode} >= {sqrtNnodes} } && {jnodedex} < {sqrtNnodes-1}) //for nodal edge corner

            conn1dex=i*P23RSc_NX+j
            conn2dex=(P23RSc_NY-1)*P23RSc_NX

            conn2dex = (P23FRBa_NY-1)*P23FRBa_NX

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes} + 1} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes} - 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE >= P23RSc_NX-1} && {dexN > -1} && {randconn < {globalconnprob}} &&{ {jnodedex} < {sqrtNnodes-1} } ) //for nodal edge

            conn1dex=i*P23RSc_NX+j
            conn2dex=(i-1)*P23RSc_NX

            float itest1arg = (i/2)

            itest1 = {trunc {itest1arg} }

            itest2 = {i} - 2*{itest1}

            if ({itest2==0})

                 float conn2dexarg = conn2dex/2

                 conn2dex = {trunc {conn2dexarg} }-(i/2)*P23FRBa_NX
                
            end

            if ({itest2==1})

                float conn2dexarg = conn2dex/2

                conn2dex = {trunc {conn2dexarg} }-((i-1)/2)*P23FRBa_NX

            end

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc}@{{mynode} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + 1} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc}@{{mynode} - 1} RAXIAL {Rgap} Vm

        end

        // E
        randconn = { rand 0 1.0 }

        if ({dexE < P23RSc_NX-1} && {randconn < {globalconnprob}})

            conn1dex=i*P23RSc_NX+j
            conn2dex=(i)*P23RSc_NX+j+1

            float itest1arg = (i/2)

            itest1 = {trunc {itest1arg} }

            itest2 = {i} - 2*{itest1}

            float jtest1arg = (j/2)

            jtest1 = {trunc {jtest1arg} }

            jtest2 = {j}  - 2*{jtest1}

            if ({itest2==0})

                 if ({jtest2==0})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-(i/2)*P23FRBa_NX+1
                                      
                 end

                 if ({jtest2==1})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-(i/2)*P23FRBa_NX+1
                                      
                 end

            end

            if ({itest2==1})

                 if ({jtest2==0})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-((i+1)/2)*P23FRBa_NX+1
  
                 end

                 if ({jtest2==1})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-((i+1)/2)*P23FRBa_NX-1
     
                 end

            end

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/sqrtNnodes

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexE >= P23RSc_NX-1} && {randconn < {globalconnprob}} && { {jnodedex} < {sqrtNnodes-1} }) //for nodal edge

            conn1dex=i*P23RSc_NX+j
            conn2dex=i*P23RSc_NX

            float itest1arg = (i/2)

            itest1 = {trunc {itest1arg} }

            itest2 = {i} - 2*{itest1}

            if ({itest2==0})

                 conn2dex = (i/2)*P23FRBa_NX
                
            end

            if ({itest2==1})

                conn2dex = ((i-1)/2)*P23FRBa_NX

            end

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc}@{{mynode} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + 1} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc}@{{mynode} - 1} RAXIAL {Rgap} Vm

        end

        // SE
        randconn = { rand 0 1.0 }

        if ({dexE < (P23RSc_NX-1) } && {dexS < (P23RSc_NY-1) } && {randconn<{globalconnprob}})

            conn1dex=i*P23RSc_NX+j
            conn2dex=(i+1)*P23RSc_NX+j+1

            float itest1arg = (i/2)

            itest1 = {trunc {itest1arg} }

            itest2 = {i} - 2*{itest1}

            float jtest1arg = (j/2)

            jtest1 = {trunc {jtest1arg} }

            jtest2 = {j}  - 2*{jtest1}

            if ({itest2==0})

                 if ({jtest2==0})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-(i/2)*P23FRBa_NX+1
                                      
                 end

                 if ({jtest2==1})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-(i/2)*P23FRBa_NX
                                      
                 end

            end

            if ({itest2==1})

                 if ({jtest2==0})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-((i+1)/2)*P23FRBa_NX+1
  
                 end

                 if ({jtest2==1})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-((i+1)/2)*P23FRBa_NX
     
                 end

            end

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/sqrtNnodes

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexE >= (P23RSc_NX-1)} && {randconn < {globalconnprob}} && {dexS < (P23RSc_NY-1)} && { {jnodedex} < {sqrtNnodes-1} }) //for nodal edge

            conn1dex=i*P23RSc_NX+j
            conn2dex=(i+1)*P23RSc_NX

            float itest1arg = (i/2)

            itest1 = {trunc {itest1arg} }

            itest2 = {i} - 2*{itest1}

            if ({itest2==0})

                 float conn2dexarg = conn2dex/2

                 conn2dex = {trunc {conn2dexarg} }-(i/2)*P23FRBa_NX
                
            end

            if ({itest2==1})

                float conn2dexarg = conn2dex/2

                conn2dex = {trunc {conn2dexarg} }-((i+1)/2)*P23FRBa_NX

            end

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc}@{{mynode} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + 1} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc}@{{mynode} - 1} RAXIAL {Rgap} Vm

        end

        if ({dexS >= P23RSc_NY-1} && {randconn < {globalconnprob}} && {dexE >= P23RSc_NX-1} && { {jnodedex} < {sqrtNnodes-1} }) //for nodal edge corner

            conn1dex=i*P23RSc_NX+j
            conn2dex=0

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes} + 1} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes} - 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE < P23RSc_NX-1} && {dexS >= P23RSc_NY-1} && {randconn < {globalconnprob}} &&{ {mynode} < {{sqrtNnodes}*{sqrtNnodes-1}} } ) //for nodal edge
 
            conn1dex=i*P23RSc_NX+j
            conn2dex=(j+1)

            float jtest1arg = (j/2)

            jtest1 = {trunc {jtest1arg} }

            jtest2 = {j}  - 2*{jtest1}

            if ({jtest2==0})

                 float conn2dexarg = conn2dex/2

                 conn2dex = {trunc {conn2dexarg} } + 1
                                      
            end

            if ({jtest2==1})

                 float conn2dexarg = conn2dex/2

                 conn2dex = {trunc {conn2dexarg} }
                                      
            end

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes}} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // S
        randconn = { rand 0 1.0 }

        if ({dexS < {P23RSc_NY-1}} && {randconn < {globalconnprob}})

            conn1dex=i*P23RSc_NX+j
            conn2dex=(i+1)*P23RSc_NX+j

            float itest1arg = (i/2)

            itest1 = {trunc {itest1arg} }

            itest2 = {i} - 2*{itest1}

            if ({itest2==0})

                 float conn2dexarg = conn2dex/2

                 conn2dex = {trunc {conn2dexarg} }-(i/2)*P23FRBa_NX

            end

            if ({itest2==1})

                 float conn2dexarg = conn2dex/2

                 conn2dex = {trunc {conn2dexarg} }-((i+1)/2)*P23FRBa_NX

            end

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        if ({dexS >= P23RSc_NY-1} && {randconn < {globalconnprob}} && { {mynode} >= {sqrtNnodes}*{sqrtNnodes-1} }) //for nodal edge

            conn1dex=i*P23RSc_NX+j
            conn2dex=j

            float truncarg = j/2

            conn2dex = {trunc {truncarg} }

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes}} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // SW
        randconn = { rand 0 1.0 }

        if ({dexS < P23RSc_NY-1} && {dexW >= 0} && {randconn<{globalconnprob}})

            conn1dex=i*P23RSc_NX+j
            conn2dex=(i+1)*P23RSc_NX+j-1

            float itest1arg = (i/2)

            itest1 = {trunc {itest1arg} }

            itest2 = {i} - 2*{itest1}

            float jtest1arg = (j/2)

            jtest1 = {trunc {jtest1arg} }

            jtest2 = {j}  - 2*{jtest1}

            if ({itest2==0})

                 if ({jtest2==0})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-(i/2)*P23FRBa_NX
                                      
                 end

                 if ({jtest2==1})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-(i/2)*P23FRBa_NX
                                      
                 end

            end

            if ({itest2==1})

                 if ({jtest2==0})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-((i+1)/2)*P23FRBa_NX
  
                 end

                 if ({jtest2==1})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-((i+1)/2)*P23FRBa_NX
     
                 end

            end

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/sqrtNnodes

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexE == 1} && {randconn < {globalconnprob}} && {dexS < P23RSc_NY-1} && { {jnodedex} > 0 }) //for nodal edge

            conn1dex=i*P23RSc_NX+j
            conn2dex=(i+2)*P23RSc_NX-1

            float itest1arg = (i/2)

            itest1 = {trunc {itest1arg} }

            itest2 = {i} - 2*{itest1}

            if ({itest2==0})

                 float conn2dexarg = conn2dex/2

                 conn2dex = {trunc {conn2dexarg} }-(i/2)*P23FRBa_NX
                
            end

            if ({itest2==1})

                 float conn2dexarg = conn2dex/2

                conn2dex = {trunc {conn2dexarg} }-((i+1)/2)*P23FRBa_NX

            end

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc}@{{mynode} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - 1} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc}@{{mynode} + 1} RAXIAL {Rgap} Vm

        end

        if ({dexS >= P23RSc_NY-1} && {randconn < {globalconnprob}} && {dexE <= 2} && { {jnodedex} > 0 }) //for nodal edge corner

            conn1dex=i*P23RSc_NX+j
            conn2dex=P23RSc_NX-1

            conn2dex = P23FRBa_NX-1

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes} + 1} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes} + 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE > 2} && {dexS >= P23RSc_NY-1} && {randconn < {globalconnprob}} &&{ {mynode} < {{sqrtNnodes}*{sqrtNnodes-1}} } ) //for nodal edge

            conn1dex=i*P23RSc_NX+j
            conn2dex=(j-1)

            float jtest1arg = (j/2)

            jtest1 = {trunc {jtest1arg} }

            jtest2 = {j}  - 2*{jtest1}

            if ({jtest2==0})

                 float conn2dexarg = conn2dex/2

                 conn2dex = {trunc {conn2dexarg} }
                                      
            end

            if ({jtest2==1})

                 float conn2dexarg = conn2dex/2

                 conn2dex = {trunc {conn2dexarg} }
                                      
            end

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes}} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // W
        randconn = { rand 0 1.0 }

        if ({dexW >= 0} && {randconn < {globalconnprob}})

            conn1dex=i*P23RSc_NX+j
            conn2dex=(i)*P23RSc_NX+j-1

            float itest1arg = (i/2)

            itest1 = {trunc {itest1arg} }

            itest2 = {i} - 2*{itest1}

            float jtest1arg = (j/2)

            jtest1 = {trunc {jtest1arg} }

            jtest2 = {j}  - 2*{jtest1}

            if ({itest2==0})

                 if ({jtest2==0})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-(i/2)*P23FRBa_NX
                                      
                 end

                 if ({jtest2==1})

                     float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-(i/2)*P23FRBa_NX
                                      
                 end

            end

            if ({itest2==1})

                 if ({jtest2==0})

                     float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-((i+1)/2)*P23FRBa_NX
  
                 end

                 if ({jtest2==1})

                     float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-((i+1)/2)*P23FRBa_NX
     
                 end

            end

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/sqrtNnodes

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexW == -1} && {randconn < {globalconnprob}} && { {jnodedex} > 0 }) //for nodal edge

            conn1dex=i*P23RSc_NX+j
            conn2dex=(i+1)*P23RSc_NX-1

            float itest1arg = (i/2)

            itest1 = {trunc {itest1arg} }

            itest2 = {i} - 2*{itest1}

            if ({itest2==0})

                 float conn2dexarg = conn2dex/2

                 conn2dex = {trunc {conn2dexarg} } - (i/2)*P23FRBa_NX
                
            end

            if ({itest2==1})

                float conn2dexarg = conn2dex/2

                conn2dex = {trunc {conn2dexarg} } - ((i+1)/2)*P23FRBa_NX

            end

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc}@{{mynode} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - 1} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc}@{{mynode} + 1} RAXIAL {Rgap} Vm

        end

        // NW
        randconn = { rand 0 1.0 }

        if ({dexW >= 0} && {dexN >= 0} && {randconn < {globalconnprob}})

            conn1dex=i*P23RSc_NX+j
            conn2dex=(i-1)*P23RSc_NX+j-1

            float itest1arg = (i/2)

            itest1 = {trunc {itest1arg} }

            itest2 = {i} - 2*{itest1}

            float jtest1arg = (j/2)

            jtest1 = {trunc {jtest1arg} }

            jtest2 = {j}  - 2*{jtest1}

            if ({itest2==0})

                 if ({jtest2==0})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-(i/2)*P23FRBa_NX
                                      
                 end

                 if ({jtest2==1})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-(i/2)*P23FRBa_NX
                                      
                 end

            end

            if ({itest2==1})

                 if ({jtest2==0})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-((i-1)/2)*P23FRBa_NX
  
                 end

                 if ({jtest2==1})

                      float conn2dexarg = conn2dex/2

                      conn2dex = {trunc {conn2dexarg} }-((i-1)/2)*P23FRBa_NX
     
                 end

            end

            conn1loc="axonLa"
            conn2loc="axonRa"

            addmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm
        end

        float jnodecalcarg = {mynode}/sqrtNnodes

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexN == -1} && {randconn < {globalconnprob}} && {dexE > 1} && { {mynode} >= {sqrtNnodes} }) //for nodal edge

            conn1dex=i*P23RSc_NX+j
            conn2dex=(P23RSc_NY-1)*P23RSc_NX+j-1

            float truncarg = (j-1)/2

            conn2dex = (P23FRBa_NY-1)*P23FRBa_NX + {trunc {truncarg} }

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes}} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        if ({dexN == -1} && {randconn < {globalconnprob}} && {dexE <= 2} && { {mynode} >= {sqrtNnodes} } && { {jnodedex} > 0 }) //for nodal edge corner

            conn1dex=i*P23RSc_NX+j
            conn2dex=(P23RSc_NY*P23RSc_NX)-1

            conn2dex = (P23FRBa_NY*P23FRBa_NX)-1
 
            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes} - 1} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes} + 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE == 1} && {dexN > -1} && {randconn < {globalconnprob}} && { {jnodedex} > 0 } ) //for nodal edge

            conn1dex=i*P23RSc_NX+j
            conn2dex=(i)*P23RSc_NX-1

            float itest1arg = (i/2)

            itest1 = {trunc {itest1arg} }

            itest2 = {i} - 2*{itest1}

            if ({itest2==0})

                 float conn2dexarg = conn2dex/2

                 conn2dex = {trunc {conn2dexarg} }-(i/2)*P23FRBa_NX
                
            end

            if ({itest2==1})

                float conn2dexarg = conn2dex/2

                conn2dex = {trunc {conn2dexarg} }-((i-1)/2)*P23FRBa_NX

            end

            conn1loc="axonLa"
            conn2loc="axonRa"

            raddmsg /P23RScnet/P23RSc[{conn1dex}]/{conn1loc} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc}@{{mynode} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - 1} /P23FRBanet/P23FRBa[{conn2dex}]/{conn2loc} /P23RScnet/P23RSc[{conn1dex}]/{conn1loc}@{{mynode} + 1} RAXIAL {Rgap} Vm

        end

    end
end

