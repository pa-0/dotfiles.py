#!/usr/bin/env python3

import os
import shutil
import subprocess
import sys
from subprocess import DEVNULL, STDOUT


def is_in_git_repo() -> bool:
    ret = subprocess.run(
        ["git", "rev-parse", "--is-inside-work-tree"], stdout=DEVNULL, stderr=DEVNULL
    )

    return ret.returncode == 0


def install_hooks(git: str) -> int:
    DOTFILES = os.getenv("DOTFILES")

    ret = subprocess.run([git, "config", "core.hooksPath", f"{DOTFILES}/git/hooks/"])

    message = (
        "Git hooks installed!"
        if ret.returncode == 0
        else "There was a problem installing git hooks"
    )

    sys.stdout.write(f"{message}\n")

    return ret.returncode


def main() -> int:
    if not (git := shutil.which("git")):
        raise RuntimeError("Git executable not found") from None

    if not is_in_git_repo():
        raise RuntimeError("Not in a git repo!") from None

    return install_hooks(git)


if __name__ == "__main__":
    raise SystemExit(main())
