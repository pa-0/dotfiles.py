import pytest

from python.templates import main


def test_main_no_args(capsys):
    code = main.main([])

    out, err = capsys.readouterr()

    assert code == 0
    assert out == "Namespace()\n"
    assert err == ""


def test_main_arg_help(capsys):
    with pytest.raises(SystemExit) as exc:
        main.main(["-h"])

    out, err = capsys.readouterr()

    assert exc.value.code == 0
    assert (
        out
        == "usage: __main__.py [-h]\n\noptions:\n  -h, --help  show this help message and exit\n"
    )
    assert err == ""


def test_main_unrecognized_argument(capsys):
    with pytest.raises(SystemExit) as exc:
        main.main(["nonsense"])

    out, err = capsys.readouterr()

    assert exc.value.code == 2
    assert out == ""
    assert err == (
        "usage: __main__.py [-h]\n__main__.py: error: unrecognized arguments: nonsense\n"
    )
