float pulse_width = 0.5     // width of pulse
float pulse_delay = 1.0          // delay before start of pulse
float pulse_interval = 0.5  // interval before next pulse
float spikefreq = 110 // Hz.   // initial value of frequency

str path
path = "/P23RSanet/P23RSa/soma"

create pulsegen {path}/pulser // Make a periodic pulse to control spikes
// make a spikegen to deliver the spikes
create spikegen {path}/pulser/spiker
setfield {path}/pulser/spiker thresh 0.5
setfield {path}/pulser level1 1.0 width1 {pulse_width} delay1 {pulse_delay}  \
	baselevel 0.0 trig_mode 0 delay2 {pulse_interval - pulse_delay} width2 5000.0 // width2 is very large so that this pulse never repeats
do_asc_file ./data-latest/pulser.{myzeropadnode} /P23RSanet/P23RSa/soma/pulser output pulserfile
//addmsg {path}/pulser pulserfile SAVE output

echo "Using simple pulsed spiketrain input"
// set the spikegen refractory period = 1/freq
setfield {path}/pulser/spiker abs_refract {1.0/spikefreq}
addmsg {path}/pulser {path}/pulser/spiker INPUT output

// Connecting pulsed spiker with very low weight to soma of cell
addmsg {path}/pulser/spiker /P23RSanet/P23RSa/soma/Ex_ch1P23RSAMPA SPIKE
setfield /P23RSanet/P23RSa/soma/Ex_ch1P23RSAMPA synapse[0].weight 3.5 synapse[0].delay 0.0

// Connecting pulsed spiker to different compartment with different weight and delay
addmsg {path}/pulser/spiker /P23RSanet/P23RSa/apobproxLa/Ex_ch1P23RSAMPA SPIKE
setfield /P23RSanet/P23RSa/apobproxLa/Ex_ch1P23RSAMPA synapse[0].weight 2.0 synapse[0].delay 0.2

// Writing output to disk
addmsg {path}/pulser/spiker /spikehist SPIKESAVE

