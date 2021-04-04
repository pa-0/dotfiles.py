" Django specific commands
command! Runserver call VimuxRunCommand("clear; echo -e 'Starting local development server'; poetry run ./manage.py runserver")
command! Makemigrations call VimuxRunCommand("clear; echo -e 'Making new migrations'; poetry run ./manage.py makemigrations")
command! RunTests call VimuxRunCommand("clear; echo -e 'Running Django Test Suite'; pdj")
command! RunLinter call VimuxRunCommand("clear; echo -e 'poetry run linter'; poetry run linter")

" Cargo Commands
command! CargoBuild call VimuxRunCommand("clear; echo -e 'cargo build'; cargo build")
command! CargoRun call VimuxRunCommand("clear; echo -e 'cargo run'; cargo run")

" Yarn Commands
command! YarnServe call VimuxRunCommand("clear; echo -e 'yarn serve'; yarn serve")
