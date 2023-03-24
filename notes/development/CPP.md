# C++

## VSCode Config

### Simple Config

#### Extensions

- clangd
- CodeLLDB

#### `settings.json`

<details>

```json
"C_Cpp.autocomplete": "Disabled",
"C_Cpp.intelliSenseEngine": "Disabled",
"cmake.generator": "MinGW Makefiles",
"cmake.sourceDirectory": "",
"makefile.makePath": "C:\\Program_Files\\msys64\\ucrt64\\bin\\mingw32-make.exe",
// "makefile.makeDirectory": ".\\demo_Makefile",
// "makefile.makefilePath": ".\\demo_Makefile\\Makefile",
"code-runner.runInTerminal": true,
"code-runner.executorMap": {
    "c": "cd $dir && clang $fileName -o $fileNameWithoutExt.exe -g -Wall -Wextra -static-libgcc -std=c99 && $dir$fileNameWithoutExt.exe",
    "cpp": "cd $dir && clang++ $fileName -o $fileNameWithoutExt.exe -g -Wall -Wextra -static-libgcc -std=c++14 && $dir$fileNameWithoutExt.exe",
}
```

</details>

#### `launch.json`

<details>

```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "debug(Clang)",
            "type": "lldb",
            "request": "launch",
            "program": "${fileDirname}${pathSeparator}${fileBasenameNoExtension}.exe",
            "args": [],
            "cwd": "${workspaceFolder}",
            "internalConsoleOptions": "neverOpen",
            "sourceMap": {
                ".": "${fileDirname}" // NOTE: https://github.com/vadimcn/vscode-lldb/wiki/Breakpoints-are-not-getting-hit
            },
            "preRunCommands": [
                "debug_info list",
                "breakpoint list",
                // "breakpoint list --verbose",
            ],
            "preLaunchTask": "compile(Clang)",
        },
        {
            "name": "debug(CMake)",
            "type": "lldb",
            "request": "launch",
            "program": "${fileDirname}${pathSeparator}build${pathSeparator}main.exe",
            "args": [],
            "cwd": "${workspaceFolder}",
            "internalConsoleOptions": "neverOpen",
            "sourceMap": {
                ".": "${fileDirname}" // NOTE: https://github.com/vadimcn/vscode-lldb/wiki/Breakpoints-are-not-getting-hit
            },
            "preRunCommands": [
                "debug_info list",
                "breakpoint list",
                // "breakpoint list --verbose",
            ],
            "preLaunchTask": "build(CMake)",
        }
    ]
}
```

</details>

#### `tasks.json`

<details>

```json
// https://code.visualstudio.com/docs/editor/tasks
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "compile(GCC)", // Task name that corresponds to the "preLaunchTask" in `launch.json`.
            "command": "g++.exe", // The compiler to use.
            "args": [
                "${file}",
                // "${fileDirname}/*.cpp",
                "-o",
                "${fileDirname}/${fileBasenameNoExtension}.exe",
                "-g", // Generate debug info.
                "-m64", // Force to generate 64-bit program.
                "-Wall",
                "-Wextra",
                "-static-libgcc", // Commonly used.
                "-std=c++14",
                // "-fexec-charset=GBK", // Use GBK encoding for the generated program for Simplified Chinese output on Windows. For Traditional Chinese use BIG5.
            ],
            "type": "process",
            "group": {
                "kind": "build",
                "isDefault": false
            },
            "presentation": {
                "echo": true,
                "reveal": "always",
                "focus": false,
                "panel": "shared"
            },
            // "problemMatcher": "$gcc"
        },
        {
            "label": "compile(Clang)",
            "command": "clang++.exe",
            // "options": {
            //     "cwd": "${workspaceFolder}"
            // },
            "args": [
                "${file}",
                // "${fileDirname}/*.cpp",
                "-o",
                "${fileDirname}/${fileBasenameNoExtension}.exe",
                // "${relativeFileDirname}/${fileBasenameNoExtension}.exe",
                "-g",
                "-fstandalone-debug", // REF: https://github.com/vadimcn/vscode-lldb/issues/415#issuecomment-815434176
                "-Wall",
                "-Wextra",
                "-static-libgcc",
                "-std=c++14",
                // "--target=x86_64-w64-mingw", // For finding header files. Default target might be msvc.
                "-fcolor-diagnostics",
                "-v"
            ],
            "type": "process",
            "group": {
                "kind": "build",
                "isDefault": false
            },
            "presentation": {
                "echo": true,
                "reveal": "always",
                "focus": false,
                "panel": "shared"
            }
        },
        {
            "label": "build(CMake)",
            "dependsOn": [
                "CMake",
                "make",
            ]
        },
        {
            "label": "CMake",
            "options": {
                "cwd": "${fileDirname}/build"
            },
            "command": "cmake.exe",
            "args": [
                "-G",
                "MinGW Makefiles",
                ".."
            ],
            "type": "process",
        },
        {
            "label": "make",
            "options": {
                "cwd": "${fileDirname}/build"
            },
            "command": "mingw32-make.exe",
            "args": [],
            "group": {
                "kind": "build",
                "isDefault": true,
            },
            "type": "process",
        },
    ]
}
```

</details>

#### `compile_flags.txt`

<details>

```text
-g
-fstandalone-debug
-Wall
-Wextra
-static-libgcc
-std=c++14
```

</details>
