# Windows Development Environment

- [MSYS2](#msys2)
- [Python](#python)
- [Rust](#rust)
  - [Host Triple `x86_64-pc-windows-gnu`](#host-triple-x86_64-pc-windows-gnu)
    - [MSYS2](#msys2-1)

## MSYS2

## Python

## Rust

I installed it under `C:\Program_Files\Rust` by setting the following environment variables before installation:

- `CARGO_HOME`: `C:\Program_Files\Rust\.cargo`
- `RUSTUP_HOME`: `C:\Program_Files\Rust\.rustup`

### Host Triple `x86_64-pc-windows-gnu`

#### MSYS2

Install the following packages:

- `mingw-w64-ucrt-x86_64-toolchain`
- `mingw-w64-ucrt-x86_64-clang`
- `mingw-w64-ucrt-x86_64-clang-tools-extra`
