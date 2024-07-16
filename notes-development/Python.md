# Python

Last modified: 2024-07-09 +0000

- [Interesting posts](#interesting-posts)
- [Installation \& environment](#installation--environment)
  - [Pyenv](#pyenv)
    - [Installation](#installation)
    - [Install different Python versions](#install-different-python-versions)
  - [venv](#venv)
    - [Create venv environment](#create-venv-environment)
    - [Activate venv environment](#activate-venv-environment)
  - [pipx](#pipx)
- [pip](#pip)
  - [Package version](#package-version)
  - [Cache](#cache)
  - [Commonly used packages](#commonly-used-packages)
- [VSCode](#vscode)
  - [`settings.json`](#settingsjson)
  - [`extension.json`](#extensionjson)
  - [Pyright extension](#pyright-extension)
- [Data Engineering](#data-engineering)
- [cx\_Freeze](#cx_freeze)

## Interesting posts

- [Status of Python versions](https://devguide.python.org/versions/)
- [What is Pythonic? \| Secret Weblog](https://blog.startifact.com/posts/older/what-is-pythonic/)
- [Everything you need to know about the switch to Python 3 | Kali Linux Documentation](https://www.kali.org/docs/general-use/python3-transition/)
- [What Are Python Wheels and Why Should You Care? – Real Python](https://realpython.com/python-wheels/)
- [Beyond If-Else: Leveraging Python’s Versatile “Else” Statements \| by Yang Zhou \| TechToFreedom \| Mar, 2024 \| Medium](https://medium.com/techtofreedom/beyond-if-else-leveraging-pythons-versatile-else-statements-9ac260dac102?sk=dd43f5b07431c222fb7332835c786af3)
- Tutorials:
  - [A Byte of Python](https://python.swaroopch.com/)
  - [A Python Interpreter Written in Python](https://aosabook.org/en/500L/a-python-interpreter-written-in-python.html)
  - [Jinja2 Explained in 5 Minutes!. (Part 4: Back-end Web Framework: Flask) \| by Diva Dugar \| codeburst](https://codeburst.io/jinja-2-explained-in-5-minutes-88548486834e)

## Installation & environment

*References*:

- [python - What is the difference between venv, pyvenv, pyenv, virtualenv, virtualenvwrapper, pipenv, etc? - Stack Overflow](https://stackoverflow.com/questions/41573587/what-is-the-difference-between-venv-pyvenv-pyenv-virtualenv-virtualenvwrappe)

### Pyenv

*References*:

- [Managing Multiple Python Versions With pyenv – Real Python](https://realpython.com/intro-to-pyenv/)

#### Installation

- openSUSE: See [[openSUSE/dev-env#pyenv]].

#### Install different Python versions

*References*;

- [Segmentation fault when installing Python 3.6.15 on Ubuntu 22.04 · Issue #2359 · pyenv/pyenv](https://github.com/pyenv/pyenv/issues/2359#issuecomment-1127107739)
- [python -m pip segfaults in 3.6.15 · Issue #2239 · pyenv/pyenv](https://github.com/pyenv/pyenv/issues/2239#issuecomment-1079275184)

### venv

#### Create venv environment

Use `python3 -m venv --upgrade-deps PATH/TO/NEW/VENV`.

*References*:

- [Creating virtual environments](https://docs.python.org/3/library/venv.html#creating-virtual-environments)

#### Activate venv environment

![venv_activate](attachments/Python/venv_activate.png)

*References*:

- [How venvs work](https://docs.python.org/3/library/venv.html#how-venvs-work)

### pipx

- [pipx](https://pypa.github.io/pipx/)

## pip

*References*:

- [Getting Started - pip documentation v24.1.2](https://pip.pypa.io/en/stable/getting-started/)

### Package version

- Search on [PyPI · The Python Package Index](https://pypi.org/).
- Or use `pip install SOME_PACKAGE==`, and all version numbers can be obtained from the error message similar to the following:

  ```text
  ERROR: Could not find a version that satisfies the requirement pip-review== (from versions: 0.3.7, 0.4, 0.5, 0.5.1, 0.5.2, 0.5.3, 1.0, 1.1.0, 1.1.1, 1.2.0, 1.3.0)
  ERROR: No matching distribution found for pip-review==
  ```

### Cache

*References*:

- [How to Clear Pip Cache in Linux](https://linuxhandbook.com/clear-pip-cache/)

### Commonly used packages

- [`black[jupyter]`](https://black.readthedocs.io/en/stable/getting_started.html#installation) for formatting
- [`mypy`](https://mypy.readthedocs.io/en/stable/getting_started.html#installing-and-running-mypy) for linting
- [`ipykernel`](https://ipython.readthedocs.io/en/stable/install/kernel_install.html#kernels-for-python-2-and-3) for VSCode Jupyter support

## VSCode

### `settings.json`

```jsonc
"python.analysis.autoImportCompletions": true,
"python.analysis.inlayHints.callArgumentNames": "partial",
"python.analysis.inlayHints.functionReturnTypes": true,
"python.analysis.inlayHints.pytestParameters": true,
"python.analysis.inlayHints.variableTypes": true,
// "python.defaultInterpreterPath": "${workspaceFolder}/.venv/bin/python",
// "python.defaultInterpreterPath": "${workspaceFolder}\\.venv\\Scripts\\python.exe",
// "python.formatting.provider": "black", // deprecated
// "python.linting.mypyEnabled": true, // deprecated
```

### `extension.json`

```jsonc
"recommendations": [
  "ms-python.python",
  "ms-toolsai.jupyter",
  "visualstudioexptteam.vscodeintellicode",
  "kevinrose.vsc-python-indent",
  "twixes.pypi-assistant",
  "donjayamanne.python-environment-manager",
]
```

### Pyright extension

*References*:

- [pyright/docs/configuration.md at main · microsoft/pyright](https://github.com/microsoft/pyright/blob/main/docs/configuration.md)

## Data Engineering

- [Feature Engineering: Scaling, Normalization, and Standardization](https://www.analyticsvidhya.com/blog/2020/04/feature-scaling-machine-learning-normalization-standardization/)
- [python - How do I get the row count of a Pandas DataFrame? - Stack Overflow](https://stackoverflow.com/questions/15943769/how-do-i-get-the-row-count-of-a-pandas-dataframe)
- [利用 python 进行线性回归 - 简书](https://www.jianshu.com/p/e55a8c9e4b56)

## cx_Freeze

From Phind:

> `cx_Freeze` is a set of scripts and modules for freezing Python scripts into executables. Freezing Python scripts into executables is a process of converting python scripts into standalone executables that can be run on systems without requiring a Python interpreter.
>
> Here are some advantages of using `cx_Freeze` over directly running Python scripts:
>
> 1. **Distribution**: If you want to distribute your Python application to users who may not have Python installed on their systems, freezing your script is a great solution. The users won't need to install Python or any dependencies your script uses - they can just run the executable.
>
> 2. **Simplicity**: It simplifies the process of running the program, especially for end-users who are not familiar with Python. They just need to double-click the executable file to run the program.
>
> 3. **Isolation**: The frozen executables are isolated and do not interfere with the host Python installation. This can be useful in scenarios where you want to avoid conflicts with the version of Python or the packages installed on the system.
>
> 4. **Security**: Freezing your script can provide a small degree of protection against people looking at your source code, as the code is compiled into byte code before being bundled into an executable. However, it should be noted that this does not provide strong protection and should not be relied upon for securing sensitive code.

*References*:

- [Setup script - cx_Freeze 6.15.12 documentation](https://cx-freeze.readthedocs.io/en/stable/setup_script.html)

[//begin]: # "Autogenerated link references for markdown compatibility"
[openSUSE/dev-env#pyenv]: ../notes-OS/Linux/openSUSE/dev-env.md "openSUSE Development Environment"
[//end]: # "Autogenerated link references"
