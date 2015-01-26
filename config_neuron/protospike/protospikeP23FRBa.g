// genesis

/* FILE INFORMATION
**
**  Function to create prototype "spikegen" element "spike"
**  with unit amplitude and 0.010 second refractory period
**
**  GENESIS 2.0
*/

function make_spk22
        if ({exists spk22})
                return
        end

        create spikegen spk22
        setfield spk22 \
                thresh  0.00 \         // V
                abs_refract     10e-3 \ // sec
                output_amp      1
end
