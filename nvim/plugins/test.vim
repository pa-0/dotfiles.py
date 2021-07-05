let test#enabled_runner = ['python#pytest']
let test#strategy = 'vimux'
let test#python#runner = 'pytest'
let test#python#pytest#options = {
\ 'nearest': '-lsxv --durations=3',
\ 'file': '--forked -qk ""',
\ 'suite': '--color yes -qk "" --forked -n 4'
\ }
