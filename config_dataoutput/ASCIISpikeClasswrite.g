// genesis
// ASCIISpikeClasswrite.g

do_classasc_file ./data/P23RSa.SPIKE.{myzeropadnode} /P23RSanet/P23RSa 1 {P23RSa_NX*P23RSa_NY} state P23RSaSPIKE
do_classasc_file ./data/P23RSb.SPIKE.{myzeropadnode} /P23RSbnet/P23RSb 2 {P23RSb_NX*P23RSb_NY} state P23RSbSPIKE
do_classasc_file ./data/P23RSc.SPIKE.{myzeropadnode} /P23RScnet/P23RSc 3 {P23RSc_NX*P23RSc_NY} state P23RScSPIKE
do_classasc_file ./data/P23RSd.SPIKE.{myzeropadnode} /P23RSdnet/P23RSd 4 {P23RSd_NX*P23RSd_NY} state P23RSdSPIKE

if ({columntype == 0})

    do_classasc_file ./data/B23FS.SPIKE.{myzeropadnode} /B23FSnet/B23FS 5 {B23FS_NX*B23FS_NY} state B23FSSPIKE
    do_classasc_file ./data/B5FS.SPIKE.{myzeropadnode} /B5FSnet/B5FS 10 {B5FS_NX*B5FS_NY} state B5FSSPIKE
    do_classasc_file ./data/P6RSc.SPIKE.{myzeropadnode} /P6RScnet/P6RSc 13 {P6RSc_NX*P6RSc_NY} state P6RScSPIKE
    do_classasc_file ./data/P6RSd.SPIKE.{myzeropadnode} /P6RSdnet/P6RSd 14 {P6RSd_NX*P6RSd_NY} state P6RSdSPIKE
    do_classasc_file ./data/C23FS.SPIKE.{myzeropadnode} /C23FSnet/C23FS 15 {C23FS_NX*C23FS_NY} state C23FSSPIKE
    do_classasc_file ./data/C5FS.SPIKE.{myzeropadnode} /C5FSnet/C5FS 16 {C5FS_NX*C5FS_NY} state C5FSSPIKE
    do_classasc_file ./data/I23LTS.SPIKE.{myzeropadnode} /I23LTSnet/I23LTS 18 {I23LTS_NX*I23LTS_NY} state I23LTSSPIKE
    do_classasc_file ./data/I5LTS.SPIKE.{myzeropadnode} /I5LTSnet/I5LTS 19 {I5LTS_NX*I5LTS_NY} state I5LTSSPIKE
    do_classasc_file ./data/P23FRBa.SPIKE.{myzeropadnode} /P23FRBanet/P23FRBa 22 {P23FRBa_NX*P23FRBa_NY} state P23FRBaSPIKE

    if ({thalamocortical == 1})
        do_classasc_file ./data/TCR.SPIKE.{myzeropadnode} /TCRnet/TCR 20 {TCR_NX*TCR_NY} state TCRSPIKE
        do_classasc_file ./data/nRT.SPIKE.{myzeropadnode} /nRTnet/nRT 21 {nRT_NX*nRT_NY} state nRTSPIKE
    end

elif ({columntype == 1})

    do_classasc_file ./data/B23FS.SPIKE.{myzeropadnode} /B23FSnet/B23FS 5 {B23FS_NX*B23FS_NY/2} state B23FSSPIKE
    do_classasc_file ./data/B5FS.SPIKE.{myzeropadnode} /B5FSnet/B5FS 10 {B5FS_NX*B5FS_NY/2} state B5FSSPIKE
    do_classasc_file ./data/C23FS.SPIKE.{myzeropadnode} /C23FSnet/C23FS 15 {C23FS_NX*C23FS_NY/2} state C23FSSPIKE
    do_classasc_file ./data/C5FS.SPIKE.{myzeropadnode} /C5FSnet/C5FS 16 {C5FS_NX*C5FS_NY/2} state C5FSSPIKE
    do_classasc_file ./data/I23LTS.SPIKE.{myzeropadnode} /I23LTSnet/I23LTS 18 {I23LTS_NX*I23LTS_NY/2} state I23LTSSPIKE
    do_classasc_file ./data/I5LTS.SPIKE.{myzeropadnode} /I5LTSnet/I5LTS 19 {I5LTS_NX*I5LTS_NY/2} state I5LTSSPIKE
    do_classasc_file ./data/P23FRBa.SPIKE.{myzeropadnode} /P23FRBanet/P23FRBa 22 {P23FRBa_NX*P23FRBa_NY/4} state P23FRBaSPIKE

    if ({thalamocortical == 1})
        do_classasc_file ./data/TCR.SPIKE.{myzeropadnode} /TCRnet/TCR 20 {TCR_NX*TCR_NY/2} state TCRSPIKE
        do_classasc_file ./data/nRT.SPIKE.{myzeropadnode} /nRTnet/nRT 21 {nRT_NX*nRT_NY/2} state nRTSPIKE
    end

end

