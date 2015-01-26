// cell.p - Cell parameter file used in TraubFS_B

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
*absolute
*cartesian
*asymmetric

//		Specifying constants
   *set_compt_param	RM	2.50  // (2.50)
   *set_compt_param	RA	2.00  // (2.00)
   *set_compt_param	CM	0.01  // (0.01)
   *set_compt_param     EREST_ACT	-0.070   //(-0.076)
   *set_compt_param     ELEAK           -0.070   //


//SOMA *************************************************************   
// For the soma, use the leakage potential (-0.07 + 0.0106) for Em
//*set_compt_param     ELEAK	-0.0594
// Actually, after Cunningham et al. PNAS 2004;101:7152-7157, will maintain
// leakage potential at ELEAK   -0.07
soma  none  0   0  20 15.0    Ca_s5 -44.38e12    NaF5            600   \
                              KDR5       1000                          \
                              KA5          10                          \
                              CaH5          1     KCs5           250   \
                              spike5        0.0


//*set_compt_param        ELEAK   -0.075
*set_compt_param	RM	2.50  // (2.50)
*set_compt_param	RA	2.00  // (2.00)
*set_compt_param	CM	0.01  // (0.01)

//PROXIMAL DENDRITE COMPARTMENTS ***************************************

// proxdendN   Cunningham et al., PNAS  2004;101:7152-7157
proxdendN  soma  0  0  60 2.12  Ca_d5 -156.99e12        NaF5     600   \
                                KDR5       1000   \
                                KA5          10   \
                                CaH5          1         KCd5     250   
                              
// proxdendE   Cunningham et al., PNAS  2004;101:7152-7157
proxdendE  soma  40  0 10 2.12  Ca_d5 -156.99e12         NaF5     600   \
                                KDR5       1000   \
                                KA5          10   \
                                CaH5          1          KCd5     250   

// proxdendS   Cunningham et al., PNAS  2004;101:7152-7157
proxdendS  soma  0  0  -40 2.12 Ca_d5 -156.99e12         NaF5     600   \
                                KDR5       1000   \
                                KA5          10   \
                                CaH5          1          KCd5     250   

// proxdendW   Cunningham et al., PNAS  2004;101:7152-7157
proxdendW  soma  -40 0 10 2.12  Ca_d5 -156.99e12        NaF5     600   \
                                KDR5       1000   \
                                KA5          10   \
                                CaH5          1          KCd5     250   

*set_compt_param	RM	2.50  // (2.50)
*set_compt_param	RA	2.00  // (2.00)
*set_compt_param	CM	0.01  // (0.01)
//*set_compt_param     ELEAK	-0.075


//North DISTAL DENDRITE COMPARTMENTS ***************************************
// distdendNlonga   Cunningham et al., PNAS  2004;101:7152-7157
distdendNlonga  proxdendN  -13.68  0  97.59 1.34 Ca_d5 -248.37e12        NaF5     600   \
                                                 KDR5       1000   \
                                                 KA5          10   \
                                                 CaH5          1         KCd5     250   

// distdendNlongb   Cunningham et al., PNAS  2004;101:7152-7157
distdendNlongb  distdendNlonga  -27.36 0 135.18 1.34  Ca_d5 -248.37e12        NaF5     600   \
                                                      KDR5       1000   \
                                                      KA5          10   \
                                                      CaH5          1         KCd5     250   

// distdendNlongc   Cunningham et al., PNAS  2004;101:7152-7157
distdendNlongc  distdendNlongb  -41.04 0 172.77 1.34  Ca_d5 -248.37e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250  

// distdendNlongd   Cunningham et al., PNAS  2004;101:7152-7157
distdendNlongd  distdendNlongc  -54.72 0 210.36 0.84  Ca_d5 -396.21e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   

// distdendNlonge   Cunningham et al., PNAS  2004;101:7152-7157
distdendNlonge  distdendNlongd  -68.40 0 247.95 0.84  Ca_d5 -396.21e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   

// distdendNlongf   Cunningham et al., PNAS  2004;101:7152-7157
distdendNlongf  distdendNlonge  -82.08 0 285.54 0.84  Ca_d5 -396.21e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   

// distdendNlongg   Cunningham et al., PNAS  2004;101:7152-7157
distdendNlongg  distdendNlongf  -95.76 0 323.13 0.84  Ca_d5 -396.21e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   

// distdendNmida   Cunningham et al., PNAS  2004;101:7152-7157
distdendNmida  proxdendN  13.68  0  97.59  1.34  Ca_d5 -248.37e12        NaF5     600   \
                                                 KDR5       1000   \
                                                 KA5          10   \
                                                 CaH5          1         KCd5     250   

// distdendNmidb   Cunningham et al., PNAS  2004;101:7152-7157
distdendNmidb  distdendNmida  27.36 0  135.18  0.84   Ca_d5 -396.21e12        NaF5     600   \
                                                      KDR5       1000   \
                                                      KA5          10   \
                                                      CaH5          1         KCd5     250   

// distdendNmidc   Cunningham et al., PNAS  2004;101:7152-7157
distdendNmidc  distdendNmidb  41.04 0 172.77  0.84    Ca_d5 -396.21e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   

// distdendNshorta   Cunningham et al., PNAS  2004;101:7152-7157
distdendNshorta  distdendNlonga   0  0  135.18  0.84  Ca_d5 -396.21e12        NaF5     600   \
                                                      KDR5       1000   \
                                                      KA5          10   \
                                                      CaH5          1         KCd5     250   

// distdendNshortb   Cunningham et al., PNAS  2004;101:7152-7157
distdendNshortb  distdendNshorta 13.68 0 172.77  0.84 Ca_d5 -396.21e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   

//East DISTAL DENDRITE COMPARTMENTS ***************************************
// distdendElonga   Cunningham et al., PNAS  2004;101:7152-7157
distdendElonga  proxdendE  97.59  13.68 0.0 1.34 Ca_d5 -248.37e12        NaF5     600   \
                                                 KDR5       1000   \
                                                 KA5          10   \
                                                 CaH5          1         KCd5     250   

// distdendElongb   Cunningham et al., PNAS  2004;101:7152-7157
distdendElongb  distdendElonga  135.18 27.36 0.0 1.34 Ca_d5 -248.37e12        NaF5     600   \
                                                      KDR5       1000   \
                                                      KA5          10   \
                                                      CaH5          1         KCd5     250   

// distdendElongc   Cunningham et al., PNAS  2004;101:7152-7157
distdendElongc  distdendElongb  172.77 41.04 0.0 1.34 Ca_d5 -248.37e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   

// distdendElongd   Cunningham et al., PNAS  2004;101:7152-7157
distdendElongd  distdendElongc  210.36 54.72 0.0 0.84 Ca_d5 -396.21e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   

// distdendElonge   Cunningham et al., PNAS  2004;101:7152-7157
distdendElonge  distdendElongd  247.95 68.40 0.0 0.84 Ca_d5 -396.21e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   

// distdendElongf   Cunningham et al., PNAS  2004;101:7152-7157
distdendElongf  distdendElonge  285.54 82.08 0.0 0.84 Ca_d5 -396.21e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   

// distdendElongg   Cunningham et al., PNAS  2004;101:7152-7157
distdendElongg  distdendElongf  323.13 95.76 0.0 0.84 Ca_d5 -396.21e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   


// distdendEmida   Cunningham et al., PNAS  2004;101:7152-7157
distdendEmida  proxdendE  97.59 -13.68 0.0 1.34  Ca_d5 -248.37e12        NaF5     600   \
                                                 KDR5       1000   \
                                                 KA5          10   \
                                                 CaH5          1         KCd5     250   

// distdendEmidb   Cunningham et al., PNAS  2004;101:7152-7157
distdendEmidb  distdendEmida 135.18 -27.36 0.0  0.84  Ca_d5 -396.21e12        NaF5     600   \
                                                      KDR5       1000   \
                                                      KA5          10   \
                                                      CaH5          1         KCd5     250   

// distdendEmidc   Cunningham et al., PNAS  2004;101:7152-7157
distdendEmidc  distdendEmidb  172.77 -41.04 0.0  0.84 Ca_d5 -396.21e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   

// distdendEshorta   Cunningham et al., PNAS  2004;101:7152-7157
distdendEshorta  distdendElonga   135.18  0  0.0 0.84 Ca_d5 -396.21e12        NaF5     600   \
                                                      KDR5       1000   \
                                                      KA5          10   \
                                                      CaH5          1         KCd5     250   

// distdendEshortb   Cunningham et al., PNAS  2004;101:7152-7157
distdendEshortb  distdendEshorta 172.77 -13.68 0.0 0.84 Ca_d5 -396.21e12        NaF5     100   \
                                                        KDR5        100   \
                                                        KA5          10   \
                                                        CaH5          2         KCd5     250   

//South DISTAL DENDRITE COMPARTMENTS ***************************************
// distdendSlonga   Cunningham et al., PNAS  2004;101:7152-7157
distdendSlonga  proxdendS  13.68  0  -97.59 1.34 Ca_d5 -248.37e12        NaF5     600   \
                                                 KDR5       1000   \
                                                 KA5          10   \
                                                 CaH5          1         KCd5     250   

// distdendSlongb   Cunningham et al., PNAS  2004;101:7152-7157
distdendSlongb  distdendSlonga  27.36 0 -135.18 1.34  Ca_d5 -248.37e12        NaF5     600   \
                                                      KDR5       1000   \
                                                      KA5          10   \
                                                      CaH5          1         KCd5     250   

// distdendSlongc   Cunningham et al., PNAS  2004;101:7152-7157
distdendSlongc  distdendSlongb  41.04 0 -172.77 1.34  Ca_d5 -248.37e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   

// distdendSlongd   Cunningham et al., PNAS  2004;101:7152-7157
distdendSlongd  distdendSlongc  54.72 0 -210.36 0.84  Ca_d5 -396.21e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   

// distdendSlonge   Cunningham et al., PNAS  2004;101:7152-7157
distdendSlonge  distdendSlongd  68.40 0 -247.95 0.84  Ca_d5 -396.21e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   

// distdendSlongf   Cunningham et al., PNAS  2004;101:7152-7157
distdendSlongf  distdendSlonge  82.08 0 -285.54 0.84  Ca_d5 -396.21e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   

// distdendSlongg   Cunningham et al., PNAS  2004;101:7152-7157
distdendSlongg  distdendSlongf  95.76 0 -323.13 0.84  Ca_d5 -396.21e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   


// distdendSmida   Cunningham et al., PNAS  2004;101:7152-7157
distdendSmida  proxdendS  -13.68  0 -97.59 1.34  Ca_d5 -248.37e12        NaF5     600   \
                                                 KDR5       1000   \
                                                 KA5          10   \
                                                 CaH5          1         KCd5     250   

// distdendSmidb   Cunningham et al., PNAS  2004;101:7152-7157
distdendSmidb  distdendSmida  -27.36 0  -135.18 0.84  Ca_d5 -396.21e12        NaF5     600   \
                                                      KDR5       1000   \
                                                      KA5          10   \
                                                      CaH5          1         KCd5     250   

// distdendSmidc   Cunningham et al., PNAS  2004;101:7152-7157
distdendSmidc  distdendSmidb  -41.04 0 -172.77  0.84  Ca_d5 -396.21e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   

// distdendSshorta   Cunningham et al., PNAS  2004;101:7152-7157
distdendSshorta  distdendSlonga   0  0  -135.18 0.84  Ca_d5 -396.21e12        NaF5     600   \
                                                      KDR5       1000   \
                                                      KA5          10   \
                                                      CaH5          1         KCd5     250   

// distdendSshortb   Cunningham et al., PNAS  2004;101:7152-7157
distdendSshortb  distdendSshorta -13.68 0 -172.77 0.84 Ca_d5 -396.21e12        NaF5     100   \
                                                       KDR5        100   \
                                                       KA5          10   \
                                                       CaH5          2         KCd5     250   

//West DISTAL DENDRITE COMPARTMENTS ***************************************
// distdendWlonga   Cunningham et al., PNAS  2004;101:7152-7157
distdendWlonga  proxdendW -97.59 -13.68 0.0 1.34 Ca_d5 -248.37e12        NaF5     600   \
                                                 KDR5       1000   \
                                                 KA5          10   \
                                                 CaH5          1         KCd5     250   

// distdendWlongb   Cunningham et al., PNAS  2004;101:7152-7157
distdendWlongb  distdendWlonga -135.18 -27.36 0.0 1.34 Ca_d5 -248.37e12        NaF5     600   \
                                                       KDR5       1000   \
                                                       KA5          10   \
                                                       CaH5          1         KCd5     250   

// distdendWlongc   Cunningham et al., PNAS  2004;101:7152-7157
distdendWlongc  distdendWlongb -172.77 -41.04 0.0 1.34 Ca_d5 -248.37e12        NaF5     100   \
                                                       KDR5        100   \
                                                       KA5          10   \
                                                       CaH5          2         KCd5     250   

// distdendWlongd   Cunningham et al., PNAS  2004;101:7152-7157
distdendWlongd  distdendWlongc -210.36 -54.72 0.0 0.84 Ca_d5 -396.21e12        NaF5     100   \
                                                       KDR5        100   \
                                                       KA5          10   \
                                                       CaH5          2         KCd5     250   

// distdendWlonge   Cunningham et al., PNAS  2004;101:7152-7157
distdendWlonge  distdendWlongd -247.95 -68.40 0.0 0.84 Ca_d5 -396.21e12        NaF5     100   \
                                                       KDR5        100   \
                                                       KA5          10   \
                                                       CaH5          2         KCd5     250   

// distdendWlongf   Cunningham et al., PNAS  2004;101:7152-7157
distdendWlongf  distdendWlonge -285.54 -82.08 0.0 0.84 Ca_d5 -396.21e12        NaF5     100   \
                                                       KDR5        100   \
                                                       KA5          10   \
                                                       CaH5          2         KCd5     250   

// distdendWlongg   Cunningham et al., PNAS  2004;101:7152-7157
distdendWlongg  distdendWlongf -323.13 -95.76 0.0 0.84 Ca_d5 -396.21e12        NaF5     100   \
                                                       KDR5        100   \
                                                       KA5          10   \
                                                       CaH5          2         KCd5     250   

// distdendWmida   Cunningham et al., PNAS  2004;101:7152-7157
distdendWmida  proxdendW  -97.59 13.68 0.0 1.34  Ca_d5 -248.37e12        NaF5     600   \
                                                 KDR5       1000   \
                                                 KA5          10   \
                                                 CaH5          1         KCd5     250   

// distdendWmidb   Cunningham et al., PNAS  2004;101:7152-7157
distdendWmidb  distdendWmida -135.18 27.36 0.0  0.84  Ca_d5 -396.21e12        NaF5     600   \
                                                      KDR5       1000   \
                                                      KA5          10   \
                                                      CaH5          1         KCd5     250   

// distdendWmidc   Cunningham et al., PNAS  2004;101:7152-7157
distdendWmidc  distdendWmidb  -172.77 41.04 0.0  0.84 Ca_d5 -396.21e12        NaF5     100   \
                                                      KDR5        100   \
                                                      KA5          10   \
                                                      CaH5          2         KCd5     250   

// distdendWshorta   Cunningham et al., PNAS  2004;101:7152-7157
distdendWshorta  distdendWlonga   -135.18  0 0.0 0.84 Ca_d5 -396.21e12        NaF5     600   \
                                                      KDR5       1000   \
                                                      KA5          10   \
                                                      CaH5          1         KCd5     250   

// distdendWshortb   Cunningham et al., PNAS  2004;101:7152-7157
distdendWshortb  distdendWshorta -172.77 13.68 0.0 0.84 Ca_d5 -396.21e12        NaF5     100   \
                                                        KDR5        100   \
                                                        KA5          10   \
                                                        CaH5          2         KCd5     250   

//		Specifying constants for axonal compartment

*set_compt_param	RM	0.2   // (0.1)
*set_compt_param	RA	0.5   // (1.0)
*set_compt_param	CM	0.013 // (0.01)
*set_compt_param     ELEAK	-0.080
  
// axona Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axona  soma  0  0 -50  1.4      Ca_s5 -190.18e12        NaF5    4000   \
                                KDR5       4000   \
                                KA5          10   \
                                CaH5          0         KCs5       0   \

// axonb Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonb  axona  0  0 -100  1.2    Ca_s5 -221.88e12        NaF5    4000   \
                                KDR5       4000   \
                                KA5          10   \
                                CaH5          0         KCs5       0   

// axonLa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonLa  axonb  -8.7  0 -149.2  1.0   Ca_s5 -266.25e12        NaF5    4000   \
                                     KDR5       4000   \
                                     KA5          10   \
                                     CaH5          0         KCs5       0   

// axonRa Fig 1. Traub et al., J Neurophysiol 2003;89:909-921
// Differs from Traub et al., in that axon is vertical
axonRa  axonb   8.7  0 -149.2  1.0   Ca_s5 -266.25e12        NaF5    4000   \
                                     KDR5       4000   \
                                     KA5          10   \
                                     CaH5          0         KCs5       0   

