// P5IBa.p - for TraubIB_VP

//	Format of file :
// x,y,z,dia are in microns, all other units are SI (Meter Kilogram Sec Amp)
// In polar mode 'r' is in microns, theta and phi in degrees 
// Control line options start with a '*'
// The format for each compartment parameter line is :
//name	parent	r	theta	phi	d	ch	dens ...
//in polar mode, and in cartesian mode :
//name	parent	x	y	z	d	ch	dens ...
// For channels, "dens" =  maximum conductance per unit area of compartment
// For spike elements, "dens" is the spike threshold
//		Coordinate mode
*relative
*cartesian
*asymmetric

//		Specifying constants
   *set_compt_param	RM	5.0   // 5.0
   *set_compt_param	RA	2.50  // 2.50
   *set_compt_param	CM	0.01 // 0.009
   *set_compt_param     EREST_ACT	-0.075
   *set_compt_param     ELEAK           -0.075


//SOMA *************************************************************   
// For the soma, use the leakage potential (-0.07 + 0.0106) for Em
//*set_compt_param     ELEAK	-0.0594
// Actually, after Traub et al. J Neurophys 2003;89:909-921, will maintain
// leakage potential at ELEAK   -0.07
soma  none   0  0  15  16     Ca_s6 -55.47e12     NaF6           2000     \
                              NaP6        1.6     KDR6           1700     \
                              KA6         200     K26               5     \
                              KM6         119     CaL6              1     \
                              CaH6         40     KCs6            160     \
                              AR6         1.0     KAHPs6            2.0

   *set_compt_param     ELEAK           -0.07

//APICAL DENDRITE COMPARTMENTS ***************************************
// apdend1 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend1  soma  0  0  75  8      Ca_d6 -11.09e12        NaF6        1500   \
                                NaP6          1.2      KDR6        1200   \
                                KA6          80        K26            5   \
                                KM6         190.4      CaL6           1   \
                                CaH6         40        KCd6         160   \
                                AR6           1.0      KAHPd6         2.0   
                               
// apdend2 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend2  apdend1  0  0  75  7.692   Ca_d6 -11.53e12       NaF6       750  \
                                    NaP6          0.6     KDR6       750  \
                                    KA6          80       K26          5  \
                                    KM6         190.4     CaL6         1  \
                                    CaH6         40       KCd6       160  \
                                    AR6           1.0     KAHPd6       2.0


// apdend3 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend3  apdend2  0  0  75  7.384   Ca_d6 -12.01e12         NaF6         150  \
                                    NaP6          0.12      KDR6           0  \
                                    KA6           6         K26            5  \
                                    KM6         190.4       CaL6           1  \
                                    CaH6         40         KCd6           5  \
                                    AR6           1.0       KAHPd6         2.0


// apdend4 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend4  apdend3  0  0  75  7.076   Ca_d6 -12.53e12        NaF6          150  \
                                    NaP6          0.12     KDR6            0  \
                                    KA6           6        K26             5  \
                                    KM6         190.4      CaL6            1  \
                                    CaH6         45        KCd6            5  \
                                    AR6           1.0      KAHPd6          2.0

// apdend5 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend5  apdend4  0  0  75  6.768   Ca_d6 -13.10e12         NaF6         150  \
                                    NaP6          0.12      KDR6           0  \
                                    KA6           6         K26            5  \
                                    KM6         190.4       CaL6           1  \
                                    CaH6         45         KCd6           5  \
                                    AR6           1.0       KAHPd6         2.0


// apdend6 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend6  apdend5  0  0  75  6.460   Ca_d6 -13.72e12         NaF6         150  \
                                    NaP6          0.12      KDR6           0  \
                                    KA6           6         K26            5  \
                                    KM6         190.4       CaL6           1  \
                                    CaH6         45         KCd6           5  \
                                    AR6           1.0       KAHPd6         2.0

// apdend7 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend7  apdend6  0  0  75  6.152   Ca_d6 -14.41e12        NaF6         150  \
                                    NaP6          0.12     KDR6           0  \
                                    KA6           6        K26            5  \
                                    KM6         190.4      CaL6           1  \
                                    CaH6         45        KCd6           5  \
                                    AR6           1.0      KAHPd6         2.0

// apdend8 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend8  apdend7  0  0  75  5.844   Ca_d6 -15.17e12     NaF6         150  \
                                    NaP6         0.12   KDR6           0  \
                                    KA6          6      K26            5  \
                                    KM6        190.4    CaL6           1  \
                                    CaH6        45      KCd6           5  \
                                    AR6          1.0    KAHPd6         2.0

// apdend9 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend9  apdend8  0  0  75  5.536   Ca_d6 -16.01e12     NaF6         150   \
                                    NaP6       0.12     KDR6           0   \
                                    KA6        6        K26            5   \
                                    KM6      190.4      CaL6           1   \
                                    CaH6      45        KCd6           5   \
                                    AR6        1.0      KAHPd6         2.0

// apdend10 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend10  apdend9  0  0  75  5.228  Ca_d6 -16.95e12     NaF6         150  \
                                    NaP6       0.12     KDR6           0  \
                                    KA6        6        K26            5  \
                                    KM6      190.4      CaL6           1  \
                                    CaH6      45        KCd6           5  \
                                    AR6        1.0      KAHPd6         2.0

// apdend11 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend11  apdend10  0  0  75  4.920    Ca_d6 -18.01e12     NaF6         30  \
                                       NaP6       0.024    KDR6          0  \
                                       KA6        6        K26           5  \
                                       KM6       56        CaL6          1  \
                                       CaH6      10        KCd6         12  \
                                       AR6        1.0      KAHPd6        2.0

// apdend12 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend12  apdend11  0  0  75  4.612    Ca_d6 -19.21e12         NaF6         30  \
                                       NaP6          0.024     KDR6          0  \
                                       KA6           6         K26           5  \
                                       KM6          56         CaL6          1  \
                                       CaH6         10         KCd6         12  \
                                       AR6           1.0       KAHPd6        2.0

// apdend13 Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend13  apdend12  0  0  75  4.308    Ca_d6 -20.56e12     NaF6         30   \
                                       NaP6          0.024 KDR6          0   \
                                       KA6           6     K26           5   \
                                       KM6          56     CaL6          1   \
                                       CaH6         10     KCd6         12   \
                                       AR6           1.0   KAHPd6        2.0

// apdend14aR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14aR  apdend13 22.5 0 55.6 4.00    Ca_d6 -27.68e12     NaF6         30  \
                                         NaP6       0.024    KDR6          0  \
                                         KA6        6        K26           5  \
                                         KM6       56        CaL6          1  \
                                         CaH6      27        KCd6         12  \
                                         AR6        2.0      KAHPd6        2.0


// apdend14bR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14bR  apdend14aR 22.5 0 55.6 4.00  Ca_d6 -27.68e12     NaF6         30  \
                                         NaP6       0.024    KDR6          0  \
                                         KA6        6        K26           5  \
                                         KM6       56        CaL6          1  \
                                         CaH6      27        KCd6         12  \
                                         AR6        2.0      KAHPd6        2.0

// apdend14cR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14cR  apdend14bR 22.5 0 55.6 1.6    Ca_d6 -69.19e12     NaF6         30  \
                                          NaP6       0.024    KDR6          0  \
                                          KA6        6        K26           5  \
                                          KM6       56        CaL6          1  \
                                          CaH6       6        KCd6         12  \
                                          AR6        2.0      KAHPd6        2.0

// apdend14dR Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14dR  apdend14cR 22.5 0 55.6 1.6 Ca_d6 -69.19e12      NaF6         30  \
                                       NaP6       0.024     KDR6          0  \
                                       KA6        6         K26           5  \
                                       KM6       56         CaL6          1  \
                                       CaH6       6         KCd6         12  \
                                       AR6        2.0       KAHPd6        2.0

// apdend14aL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14aL  apdend13 -22.5 0 55.6 4.00    Ca_d6 -27.68e12     NaF6         30  \
                                          NaP6       0.024    KDR6          0  \
                                          KA6        6        K26           5  \
                                          KM6       56        CaL6          1  \
                                          CaH6      27        KCd6         12  \
                                          AR6        2.0      KAHPd6        2.0


// apdend14bL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14bL  apdend14aL -22.5 0 55.6 4.00  Ca_d6 -27.68e12     NaF6         30  \
                                          NaP6       0.024    KDR6          0  \
                                          KA6        6        K26           5  \
                                          KM6       56        CaL6          1  \
                                          CaH6      27        KCd6         12  \
                                          AR6        2.0      KAHPd6        2.0

// apdend14cL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14cL  apdend14bL -22.5 0 55.6 1.6    Ca_d6 -69.19e12     NaF6         30  \
                                           NaP6       0.024    KDR6          0  \
                                           KA6        6        K26           5  \
                                           KM6       56        CaL6          1  \
                                           CaH6       6        KCd6         12  \
                                           AR6        2.0      KAHPd6        2.0

// apdend14dL Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apdend14dL  apdend14cL -22.5 0 55.6 1.6 Ca_d6 -69.19e12      NaF6         30  \
                                        NaP6       0.024     KDR6          0  \
                                        KA6        6         K26           5  \
                                        KM6       56         CaL6          1  \
                                        CaH6       6         KCd6         12  \
                                        AR6        2.0       KAHPd6        2.0

//APICAL OBLIQUE DENDRITE COMPARTMENTS ***************************************

// apobdistRa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistRa  apdend3  60  0 0.0 1.0      Ca_d6 -110.70e12    NaF6          750  \
                                        NaP6        0.6     KDR6          750  \
                                        KA6        80       K26             5  \
                                        KM6       190.4     CaL6            1  \
                                        CaH6       40       KCd6          160  \
                                        AR6         1.0     KAHPd6          2.0

// apobdistRb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistRb  apobdistRa  60  0 0.0 1.0    Ca_d6 -110.70e12    NaF6          150  \
                                         NaP6       0.12     KDR6            0  \
                                         KA6        6        K26             5  \
                                         KM6      190.4      CaL6            1  \
                                         CaH6      40        KCd6            5  \
                                         AR6        1.0      KAHPd6          2.0

// apobdistRc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistRc  apobdistRb  60  0 0.0 1.0    Ca_d6 -110.70e12    NaF6          150  \
                                         NaP6       0.12     KDR6            0  \
                                         KA6        6        K26             5  \
                                         KM6      190.4      CaL6            1  \
                                         CaH6      40        KCd6            5  \
                                         AR6        1.0      KAHPd6          2.0

// apobdistLa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistLa  apdend3  -60  0 0.0 1.0      Ca_d6 -110.70e12    NaF6          750  \
                                         NaP6        0.6     KDR6          750  \
                                         KA6        80       K26             5  \
                                         KM6       190.4     CaL6            1  \
                                         CaH6       40       KCd6          160  \
                                         AR6         1.0     KAHPd6          2.0

// apobdistLb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistLb  apobdistLa  -60  0 0.0 1.0    Ca_d6 -110.70e12    NaF6          150  \
                                          NaP6       0.12     KDR6            0  \
                                          KA6        6        K26             5  \
                                          KM6      190.4      CaL6            1  \
                                          CaH6      40        KCd6            5  \
                                          AR6        1.0      KAHPd6          2.0

// apobdistLc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobdistLc  apobdistLb  -60 0 0.0 1.0     Ca_d6 -110.70e12    NaF6          150  \
                                          NaP6       0.12     KDR6            0  \
                                          KA6        6        K26             5  \
                                          KM6      190.4      CaL6            1  \
                                          CaH6      40        KCd6            5  \
                                          AR6        1.0      KAHPd6          2.0

// apobmidRa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidRa  apdend2  60  0 0.0  1.0      Ca_d6 -110.70e12    NaF6          750  \
                                        NaP6        0.6     KDR6          750  \
                                        KA6        80       K26             5  \
                                        KM6       190.4     CaL6            1  \
                                        CaH6       40       KCd6          160  \
                                        AR6         1.0     KAHPd6          2.0

// apobmidRb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidRb  apobmidRa  60  0 0.0  1.0     Ca_d6 -110.70e12    NaF6          150  \
                                         NaP6       0.12     KDR6            0  \
                                         KA6        6        K26             5  \
                                         KM6      190.4      CaL6            1  \
                                         CaH6      40        KCd6            5  \
                                         AR6        1.0      KAHPd6          2.0

// apobmidRc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidRc  apobmidRb  60  0 0.0  1.0     Ca_d6 -110.70e12    NaF6          150  \
                                         NaP6       0.12     KDR6            0  \
                                         KA6        6        K26             5  \
                                         KM6      190.4      CaL6            1  \
                                         CaH6      40        KCd6            5  \
                                         AR6        1.0      KAHPd6          2.0

// apobmidLa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidLa  apdend2  -60  0 0.0  1.0      Ca_d6 -110.70e12    NaF6          750  \
                                         NaP6        0.6     KDR6          750  \
                                         KA6        80       K26             5  \
                                         KM6       190.4     CaL6            1  \
                                         CaH6       40       KCd6          160  \
                                         AR6         1.0     KAHPd6          2.0

// apobmidLb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidLb  apobmidLa  -60  0 0.0  1.0     Ca_d6 -110.70e12    NaF6          150  \
                                          NaP6       0.12     KDR6            0  \
                                          KA6        6        K26             5  \
                                          KM6      190.4      CaL6            1  \
                                          CaH6      40        KCd6            5  \
                                          AR6        1.0      KAHPd6          2.0

// apobmidLc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobmidLc  apobmidLb  -60  0 0.0  1.0     Ca_d6 -110.70e12    NaF6          150  \
                                          NaP6       0.12     KDR6            0  \
                                          KA6        6        K26             5  \
                                          KM6      190.4      CaL6            1  \
                                          CaH6      40        KCd6            5  \
                                          AR6        1.0      KAHPd6          2.0

// apobproxRa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxRa  apdend1  60  0 0.0  1.0      Ca_d6 -110.70e12    NaF6          750  \
                                         NaP6        0.6     KDR6          750  \
                                         KA6        80       K26             5  \
                                         KM6       190.4     CaL6            1  \
                                         CaH6       40       KCd6          160  \
                                         AR6         1.0     KAHPd6          2.0

// apobproxRb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxRb  apobproxRa  60  0 0.0  1.0     Ca_d6 -110.70e12    NaF6          150  \
                                           NaP6       0.12     KDR6            0  \
                                           KA6        6        K26             5  \
                                           KM6      190.4      CaL6            1  \
                                           CaH6      40        KCd6            5  \
                                           AR6        1.0      KAHPd6          2.0

// apobproxRc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxRc  apobproxRb  60  0 0.0  1.0     Ca_d6 -110.70e12    NaF6          150  \
                                           NaP6       0.12     KDR6            0  \
                                           KA6        6        K26             5  \
                                           KM6      190.4      CaL6            1  \
                                           CaH6      40        KCd6            5  \
                                           AR6        1.0      KAHPd6          2.0

// apobproxLa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxLa  apdend1  -60  0 0.0  1.0      Ca_d6 -110.70e12    NaF6          750  \
                                          NaP6        0.6     KDR6          750  \
                                          KA6        80       K26             5  \
                                          KM6       190.4     CaL6            1  \
                                          CaH6       40       KCd6          160  \
                                          AR6         1.0     KAHPd6          2.0

// apobproxLb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxLb  apobproxLa  -60  0 0.0  1.0     Ca_d6 -110.70e12    NaF6          150  \
                                            NaP6       0.12     KDR6            0  \
                                            KA6        6        K26             5  \
                                            KM6      190.4      CaL6            1  \
                                            CaH6      40        KCd6            5  \
                                            AR6        1.0      KAHPd6          2.0

// apobproxLc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
apobproxLc  apobproxLb  -60  0 0.0  1.0     Ca_d6 -110.70e12    NaF6          150  \
                                            NaP6       0.12     KDR6            0  \
                                            KA6        6        K26             5  \
                                            KM6      190.4      CaL6            1  \
                                            CaH6      40        KCd6            5  \
                                            AR6        1.0      KAHPd6          2.0


//BASAL DENDRITE COMPARTMENTS ************************************************
// basalLsupera Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLsupera  soma  -53.5  0  -27.2  1.0    Ca_d6 -110.70e12    NaF6        750  \
                                            NaP6        0.6     KDR6        750  \
                                            KA6        80       K26           5  \
                                            KM6       190.4     CaL6          1  \
                                            CaH6       40       KCd6        160  \
                                            AR6         1.0     KAHPd6        2.0

// basalLsuperb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLsuperb  basalLsupera  -53.5  0 -27.2  1.0     Ca_d6 -110.70e12    NaF6        150  \
                                                    NaP6        0.12    KDR6          0  \
                                                    KA6         6       K26           5  \
                                                    KM6       190.4     CaL6          1  \
                                                    CaH6       40       KCd6          5  \
                                                    AR6         1.0     KAHPd6        2.0

// basalLsuperc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLsuperc  basalLsuperb  -53.5  0 -27.2  1.0     Ca_d6 -110.70e12    NaF6        150  \
                                                    NaP6        0.12    KDR6          0  \
                                                    KA6         6       K26           5  \
                                                    KM6       190.4     CaL6          1  \
                                                    CaH6       40       KCd6          5  \
                                                    AR6         1.0     KAHPd6        2.0

// basalLmida Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLmida  soma  -38.6  0  -46.0  1.0      Ca_d6 -110.70e12    NaF6        750  \
                                            NaP6        0.6     KDR6        750  \
                                            KA6        80       K26           5  \
                                            KM6       190.4     CaL6          1  \
                                            CaH6       40       KCd6        160  \
                                            AR6         1.0     KAHPd6        2.0

// basalLmidb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLmidb  basalLmida  -38.6  0 -46.0  1.0         Ca_d6 -110.70e12    NaF6        150  \
                                                    NaP6        0.12    KDR6          0  \
                                                    KA6         6       K26           5  \
                                                    KM6       190.4     CaL6          1  \
                                                    CaH6       40       KCd6          5  \
                                                    AR6         1.0     KAHPd6        2.0

// basalLmidc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalLmidc  basalLmidb  -38.6  0 -46.0  1.0         Ca_d6 -110.70e12    NaF6        150  \
                                                    NaP6        0.12    KDR6          0  \
                                                    KA6         6       K26           5  \
                                                    KM6       190.4     CaL6          1  \
                                                    CaH6       40       KCd6          5  \
                                                    AR6         1.0     KAHPd6        2.0

// basalRsupera Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRsupera  soma  53.5  0  -27.2  1.0     Ca_d6 -110.70e12    NaF6        750  \
                                            NaP6        0.6     KDR6        750  \
                                            KA6        80       K26           5  \
                                            KM6       190.4     CaL6          1  \
                                            CaH6       40       KCd6        160  \
                                            AR6         1.0     KAHPd6        2.0

// basalRsuperb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRsuperb  basalRsupera  53.5  0 -27.2  1.0      Ca_d6 -110.70e12    NaF6        150  \
                                                    NaP6        0.12    KDR6          0  \
                                                    KA6         6       K26           5  \
                                                    KM6       190.4     CaL6          1  \
                                                    CaH6       40       KCd6          5  \
                                                    AR6         1.0     KAHPd6        2.0

// basalRsuperc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRsuperc  basalRsuperb  53.5  0 -27.2  1.0      Ca_d6 -110.70e12    NaF6        150  \
                                                    NaP6        0.12    KDR6          0  \
                                                    KA6         6       K26           5  \
                                                    KM6       190.4     CaL6          1  \
                                                    CaH6       40       KCd6          5  \
                                                    AR6         1.0     KAHPd6        2.0

// basalRmida Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRmida  soma  38.6  0  -46.0  1.0       Ca_d6 -110.70e12    NaF6        750  \
                                            NaP6        0.6     KDR6        750  \
                                            KA6        80       K26           5  \
                                            KM6       190.4     CaL6          1  \
                                            CaH6       40       KCd6        160  \
                                            AR6         1.0     KAHPd6        2.0

// basalRmidb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRmidb  basalRmida  38.6  0 -46.0  1.0          Ca_d6 -110.70e12    NaF6        150  \
                                                    NaP6        0.12    KDR6          0  \
                                                    KA6         6       K26           5  \
                                                    KM6       190.4     CaL6          1  \
                                                    CaH6       40       KCd6          5  \
                                                    AR6         1.0     KAHPd6        2.0

// basalRmidc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basalRmidc  basalRmidb  38.6  0 -46.0  1.0          Ca_d6 -110.70e12    NaF6        150  \
                                                    NaP6        0.12    KDR6          0  \
                                                    KA6         6       K26           5  \
                                                    KM6       190.4     CaL6          1  \
                                                    CaH6       40       KCd6          5  \
                                                    AR6         1.0     KAHPd6        2.0

// basaldeepa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basaldeepa  soma  0  0  -60.0  1.0          Ca_d6 -110.70e12    NaF6        750  \
                                            NaP6        0.6     KDR6        750  \
                                            KA6        80       K26           5  \
                                            KM6       190.4     CaL6          1  \
                                            CaH6       40       KCd6        160  \
                                            AR6         1.0     KAHPd6        2.0

// basaldeepb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basaldeepb  basaldeepa  0  0 -60.0  1.0             Ca_d6 -110.70e12    NaF6        150  \
                                                    NaP6        0.12    KDR6          0  \
                                                    KA6         6       K26           5  \
                                                    KM6       190.4     CaL6          1  \
                                                    CaH6       40       KCd6          5  \
                                                    AR6         1.0     KAHPd6        2.0

// basaldeepc Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
basaldeepc  basaldeepb  0  0 -60.0  1.0             Ca_d6 -110.70e12    NaF6        150  \
                                                    NaP6        0.12    KDR6          0  \
                                                    KA6         6       K26           5  \
                                                    KM6       190.4     CaL6          1  \
                                                    CaH6       40       KCd6          5  \
                                                    AR6         1.0     KAHPd6        2.0


//		Specifying constants for axonal compartment RMCM=0.0014 (0.0009)
*set_compt_param	RM	0.10   // (0.10)
*set_compt_param	RA	1.00   // (1.00)
*set_compt_param	CM	0.009  // (0.009)
*set_compt_param     EREST_ACT	-0.075
*set_compt_param     ELEAK	-0.075

//AXONAL COMPARTMENTS ***************************************
// axona Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axona  soma  0  0 -25  1.8      NaF6       4500   \
                                NaP6          0.0     KDR6       4500   \
                                KA6           6       K26           5   \
                                KM6         420       CaL6          0   \
                                CaH6          0   \
                                AR6           0   

// axonb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonb  axona  0  0 -50  1.4     NaF6       4500   \
                                NaP6          0.0     KDR6       4500   \
                                KA6           6       K26           5   \
                                KM6         420       CaL6          0   \
                                CaH6          0   \
                                AR6           0

// axonLa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonLa  axonb  -8.7  0 -49.2  1.2    NaF6       4500   \
                                     NaP6          0.0     KDR6       4500   \
                                     KA6           6       K26           5   \
                                     KM6         420       CaL6          0   \
                                     CaH6          0   \
                                     AR6           0   

// axonLb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonLb  axonLa  -8.7  0 -49.2  1.0   NaF6       4500   \
                                     NaP6          0.0     KDR6       4500   \
                                     KA6           6       K26           5   \
                                     KM6         420       CaL6          0   \
                                     CaH6          0   \
                                     AR6           0   

// axonRa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonRa  axonb   8.7  0 -49.2  1.2    NaF6       4500   \
                                     NaP6          0.0     KDR6       4500   \
                                     KA6           6       K26           5   \
                                     KM6         420       CaL6          0   \
                                     CaH6          0   \
                                     AR6           0  

// axonRb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonRb  axonRa   8.7  0 -49.2  1.0   NaF6       4500   \
                                     NaP6          0.0     KDR6       4500   \
                                     KA6           6       K26           5   \
                                     KM6         420       CaL6          0   \
                                     CaH6          0   \
                                     AR6           0     