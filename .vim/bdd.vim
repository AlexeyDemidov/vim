" Vim functions to run RSpec and Cucumber on the current file and optionally on
" the spec/scenario under the cursor.

function! RailsScriptIfExists(name)
  " Bundle exec
  if isdirectory(".bundle") || (exists("b:rails_root") && isdirectory(b:rails_root . "/.bundle"))
    return "bundle exec " . a:name
  " System Binary
  else
    return "bundle exec " . a:name
  end
endfunction

function! RunRSpec(args)
  let spec = RailsScriptIfExists("spec --drb")
  let cmd = spec . " " . a:args . " -fn -c " . @%
  execute ":! echo " . cmd . " && " . cmd
endfunction

function! RunCucumber(args)
  let cucumber_bin = RailsScriptIfExists("cucumber --drb")
  let cmd = cucumber_bin . " " . @% . a:args
  execute ":! echo " . cmd . " && " . cmd
endfunction

function! RunTestFile(args)
  if @% =~ "\.feature$"
    call RunCucumber("" . a:args)
  elseif @% =~ "\.rb$"
    call RunRSpec("" . a:args)
  end
endfunction

function! RunTest(args)
  if @% =~ "\.feature$"
    call RunCucumber(":" . line('.') . a:args)
  elseif @% =~ "\.rb$"
    call RunRSpec("-l " . line('.') . a:args)
  end
endfunction

map <Leader>; :call RunTest("")<CR>
map <Leader>' :call RunTestFile("")<CR> 
