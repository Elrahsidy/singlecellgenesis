// genesis

/*
 * Setting up a function for doing disk output
 */

function do_disk_out(diskpath,srcpath,field)
  str name
  create disk_out /output/{diskpath}

  setfield /output/{diskpath} leave_open 1  flush 0

  foreach name ({getelementlist {srcpath}})
    addmsg {name} /output/{diskpath} SAVE {field}
  end

  echo {diskpath}
end


/*
 * Creating disk output files for the P23RSa neurons to send stuff to,
 * using the function defined above.
 */

// do_disk_out P23RSa_disk  /P23RSanet/P23RSa[]/soma  Vm

