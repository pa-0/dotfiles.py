import pytest

from python.templates import main


def test_main_no_args(capsys):
    main.main([])

    out, err = capsys.readouterr()

    assert out == "Namespace()\n"
    assert err == ""


def test_main_arg_help(capsys):
    with pytest.raises(SystemExit):
        main.main(["-h"])

    out, err = capsys.readouterr()

    assert (
        out
        == "usage: __main__.py [-h]\n\noptions:\n  -h, --help  show this help message and exit\n"
    )
    assert err == ""
