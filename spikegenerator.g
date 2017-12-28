float pulse_width = {tmax}     // width of pulse
float pulse_delay = 0          // delay before start of pulse
float pulse_interval = {tmax}  // interval before next pulse
float spikefreq = 110 // Hz.   // initial value of frequency

str path
path = "/P23RSanet/P23RSa/soma"

create pulsegen {path}/spikepulse // Make a periodic pulse to control spikes
// make a spikegen to deliver the spikes
create spikegen {path}/spikepulse/spike
setfield {path}/spikepulse/spike thresh 0.5
setfield {path}/spikepulse width1 {pulse_width} delay1 {pulse_delay}  \
	baselevel 0.0 trig_mode 0 delay2 {pulse_interval - pulse_delay} width2 0

echo "Using simple pulsed spiketrain input"
// set the spikegen refractory period = 1/freq
setfield {path}/spikepulse/spike abs_refract {1.0/spikefreq}
addmsg {path}/spikepulse {path}/spikepulse/spike INPUT output

addmsg /P23RSanet/P23RSa/soma {path}/spikepulse/spike INPUT Vm

addmsg {path}/spikepulse/spike /P23RSanet/P23RSa/soma/Ex_ch1P23RSAMPA SPIKE
setfield /P23RSanet/P23RSa/soma/Ex_ch1P23RSAMPA synapse[0].weight 10 synapse[0].delay 0.005

