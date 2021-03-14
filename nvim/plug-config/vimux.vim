" Django specific commands
command! Runserver call VimuxRunCommand("clear; echo -e 'Starting local development server'; poetry run ./manage.py runserver")
command! Makemigrations call VimuxRunCommand("clear; echo -e 'Making new migrations'; poetry run ./manage.py makemigrations")
command! RunTests call VimuxRunCommand("clear; echo -e 'Running Django Test Suite'; pdj")
command! RunLinter call VimuxRunCommand("clear; echo -e 'poetry run linter'; poetry run linter")
