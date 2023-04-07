# C++

- [C++](#c)
    - [`.clang-format`](#clang-format)
        - [ANGLE](#angle)
        - [Chromium](#chromium)
    - [VSCode Config](#vscode-config)
        - [Simple Config](#simple-config)
            - [Extensions](#extensions)
            - [`settings.json`](#settingsjson)
            - [`launch.json`](#launchjson)
            - [`tasks.json`](#tasksjson)
            - [`compile_flags.txt`](#compile_flagstxt)
    - [array vs vector vs list](#array-vs-vector-vs-list)

## `.clang-format`

### ANGLE

<details>

```yaml
# Defines the ANGLE style for automatic reformatting.
# https://code.google.com/p/angleproject/wiki/CodingStandard
# See Clang docs: http://clang.llvm.org/docs/ClangFormatStyleOptions.html
BasedOnStyle: Chromium
# Allow double brackets such as std::vector<std::vector<int>>.
Standard: Cpp11
# Indent 4 spaces at a time.
IndentWidth: 4
# Keep lines under 100 columns long.
ColumnLimit: 100
# Always break before braces
BreakBeforeBraces: Custom
BraceWrapping:
  AfterCaseLabel: true
  AfterClass: true
  AfterControlStatement: true
  AfterEnum: true
  AfterFunction: true
  AfterNamespace: true
  AfterStruct: true
  AfterUnion: true
  BeforeCatch: true
  BeforeElse: true
  IndentBraces: false
  SplitEmptyFunction: false
  SplitEmptyRecord: false
  SplitEmptyNamespace: false
  # Keeps extern "C" blocks unindented.
  AfterExternBlock: false
# Indent case labels.
IndentCaseLabels: true
# Right-align pointers and references
PointerAlignment: Right
# ANGLE likes to align things as much as possible.
AlignOperands: true
AlignConsecutiveAssignments: true
# Use 2 space negative offset for access modifiers
AccessModifierOffset: -2
# TODO(jmadill): Decide if we want this on. Doesn't have an "all or none" mode.
AllowShortCaseLabelsOnASingleLine: false
# Useful for spacing out functions in classes
KeepEmptyLinesAtTheStartOfBlocks: true
# Indent nested PP directives.
IndentPPDirectives: AfterHash
# Include blocks style
IncludeBlocks: Preserve
```

</details>

references:

- https://chromium.googlesource.com/angle/angle/+/HEAD/.clang-format

### Chromium

<details>

```yaml
# Defines the Chromium style for automatic reformatting.
# http://clang.llvm.org/docs/ClangFormatStyleOptions.html
BasedOnStyle: Chromium
# This defaults to 'Auto'. Explicitly set it for a while, so that
# 'vector<vector<int> >' in existing files gets formatted to
# 'vector<vector<int>>'. ('Auto' means that clang-format will only use
# 'int>>' if the file already contains at least one such instance.)
Standard: Cpp11
# TODO(crbug.com/1392808): Remove when InsertBraces has been upstreamed into
# the Chromium style (is implied by BasedOnStyle: Chromium).
InsertBraces: true
InsertNewlineAtEOF: true
# Make sure code like:
# IPC_BEGIN_MESSAGE_MAP()
#   IPC_MESSAGE_HANDLER(WidgetHostViewHost_Update, OnUpdate)
# IPC_END_MESSAGE_MAP()
# gets correctly indented.
MacroBlockBegin: "^\
BEGIN_MSG_MAP|\
BEGIN_MSG_MAP_EX|\
BEGIN_SAFE_MSG_MAP_EX|\
CR_BEGIN_MSG_MAP_EX|\
IPC_BEGIN_MESSAGE_MAP|\
IPC_BEGIN_MESSAGE_MAP_WITH_PARAM|\
IPC_PROTOBUF_MESSAGE_TRAITS_BEGIN|\
IPC_STRUCT_BEGIN|\
IPC_STRUCT_BEGIN_WITH_PARENT|\
IPC_STRUCT_TRAITS_BEGIN|\
POLPARAMS_BEGIN|\
PPAPI_BEGIN_MESSAGE_MAP$"
MacroBlockEnd: "^\
CR_END_MSG_MAP|\
END_MSG_MAP|\
IPC_END_MESSAGE_MAP|\
IPC_PROTOBUF_MESSAGE_TRAITS_END|\
IPC_STRUCT_END|\
IPC_STRUCT_TRAITS_END|\
POLPARAMS_END|\
PPAPI_END_MESSAGE_MAP$"
```

</details>

References:

- https://chromium.googlesource.com/chromium/src/+/HEAD/.clang-format

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

## array vs vector vs list

References:

- [When to use arrays vs. vectors vs. lists?](https://www.reddit.com/r/cpp_questions/comments/5lqm5w/when_to_use_arrays_vs_vectors_vs_lists/)
