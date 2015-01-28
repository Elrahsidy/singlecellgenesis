// genesis
// ASCIISpikeClasswrite.g

    int myzeropadnode = {mynode}
    if({mynode} < 10)
        myzeropadnode = "0{mynode}"
    end

    do_classasc_file ./data/P23RSaSPIKE.dat{myzeropadnode} /P23RSanet/P23RSa 1 {P23RSa_NX*P23RSa_NY} state P23RSaSPIKE
    do_classasc_file ./data/P23RSbSPIKE.dat{myzeropadnode} /P23RSbnet/P23RSb 2 {P23RSb_NX*P23RSb_NY} state P23RSbSPIKE
    do_classasc_file ./data/P23RScSPIKE.dat{myzeropadnode} /P23RScnet/P23RSc 3 {P23RSc_NX*P23RSc_NY} state P23RScSPIKE
    do_classasc_file ./data/P23RSdSPIKE.dat{myzeropadnode} /P23RSdnet/P23RSd 4 {P23RSd_NX*P23RSd_NY} state P23RSdSPIKE

    do_classasc_file ./data/B23FSSPIKE.dat{myzeropadnode} /B23FSnet/B23FS 5 {B23FS_NX*B23FS_NY} state B23FSSPIKE
