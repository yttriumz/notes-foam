# Python

## VSCode workspace config

```json
"[python]": {
	"editor.formatOnSave": true,
    "editor.formatOnType": true
},
"python.analysis.autoImportCompletions": true,
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

## Environment

### Virtual Environment

#### Activate

![venv_activate](attachments/venv_activate.png)

*References*:

- [How venvs work]( https://docs.python.org/3/library/venv.html#how-venvs-work )

### pip packages

- [`black[jupyter]`](https://black.readthedocs.io/en/stable/getting_started.html#installation) for formatting
- [`mypy`](https://mypy.readthedocs.io/en/stable/getting_started.html#installing-and-running-mypy) for linting
- [`ipykernel`](https://ipython.readthedocs.io/en/stable/install/kernel_install.html#kernels-for-python-2-and-3) for VSCode Jupyter support

## Data Engineering

- [Feature Engineering: Scaling, Normalization, and Standardization](https://www.analyticsvidhya.com/blog/2020/04/feature-scaling-machine-learning-normalization-standardization/)

## Interesting posts

- [500 Lines or Less
A Python Interpreter Written in Python](https://aosabook.org/en/500L/a-python-interpreter-written-in-python.html)
