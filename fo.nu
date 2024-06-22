#!/usr/bin/env nu
let filename = fzf | prepend "/" | prepend $env.PWD | str join "" | str trim

  #move to directory of file
  let dir = $filename | path dirname 
  cd $dir

  #check if in git repo and if yes, move to top directory
  let git_cmd = git rev-parse --show-toplevel | complete
  print $git_cmd

  if $git_cmd.exit_code == 0 {
    let git_dir = $git_cmd.stdout | str trim
    cd $git_dir
  } 

  hx $filename
