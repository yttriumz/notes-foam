# Python

Last modified: 2023/12/29 UTC

- [Interesting posts](#interesting-posts)
- [VSCode](#vscode)
  - [`settings.json`](#settingsjson)
  - [`extension.json`](#extensionjson)
  - [Pyright extension](#pyright-extension)
- [Manage environment](#manage-environment)
  - [Pyenv](#pyenv)
  - [venv](#venv)
    - [Create venv environment](#create-venv-environment)
    - [Activate venv environment](#activate-venv-environment)
  - [pip packages](#pip-packages)
  - [pipx](#pipx)
- [Data Engineering](#data-engineering)
- [cx\_Freeze](#cx_freeze)

## Interesting posts

- [Status of Python versions](https://devguide.python.org/versions/)
- [Everything you need to know about the switch to Python 3 | Kali Linux Documentation](https://www.kali.org/docs/general-use/python3-transition/)
- [A Python Interpreter Written in Python](https://aosabook.org/en/500L/a-python-interpreter-written-in-python.html)

## VSCode

### `settings.json`

```json
"[python]": {
  "editor.formatOnSave": true,
  "editor.formatOnType": true
},
"python.analysis.autoImportCompletions": true,
"python.analysis.inlayHints.callArgumentNames": "partial",
"python.analysis.inlayHints.functionReturnTypes": true,
"python.analysis.inlayHints.pytestParameters": true,
"python.analysis.inlayHints.variableTypes": true,
// "python.defaultInterpreterPath": "${workspaceFolder}/.venv/bin/python",
// "python.defaultInterpreterPath": "${workspaceFolder}\\.venv\\Scripts\\python.exe",
"python.formatting.provider": "black",
"python.formatting.blackArgs": [
  "--line-length",
  "80"
],
"python.linting.mypyEnabled": true,
```

### `extension.json`

```json
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

## Manage environment

*References*:

- [python - What is the difference between venv, pyvenv, pyenv, virtualenv, virtualenvwrapper, pipenv, etc? - Stack Overflow](https://stackoverflow.com/questions/41573587/what-is-the-difference-between-venv-pyvenv-pyenv-virtualenv-virtualenvwrappe)

### Pyenv

For installation, see:

- openSUSE Tumbleweed: [[Tumbleweed/dev-env#Pyenv]]

### venv

#### Create venv environment

Use `python3 -m venv --upgrade-deps PATH/TO/NEW/VENV`.

*References*:

- [Creating virtual environments](https://docs.python.org/3/library/venv.html#creating-virtual-environments)

#### Activate venv environment

![venv_activate](attachments/venv_activate.png)

*References*:

- [How venvs work](https://docs.python.org/3/library/venv.html#how-venvs-work)

### pip packages

- [`black[jupyter]`](https://black.readthedocs.io/en/stable/getting_started.html#installation) for formatting
- [`mypy`](https://mypy.readthedocs.io/en/stable/getting_started.html#installing-and-running-mypy) for linting
- [`ipykernel`](https://ipython.readthedocs.io/en/stable/install/kernel_install.html#kernels-for-python-2-and-3) for VSCode Jupyter support

### pipx

- [pipx](https://pypa.github.io/pipx/)

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
[Tumbleweed/dev-env#Pyenv]: ..%2Fnotes-OS%2FLinux%2FopenSUSE%2FTumbleweed%2Fdev-env.md "OpenSUSE Tumbleweed Development Environment"
[//end]: # "Autogenerated link references"
