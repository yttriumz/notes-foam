# Bash Usage

Last modified: 2024/03/07 UTC

- [Interesting posts](#interesting-posts)
- [Configuration files](#configuration-files)
- [History](#history)
    - [Customize history](#customize-history)
- [Alias](#alias)
    - [Alias expansion](#alias-expansion)
    - [Auto-completion for aliases](#auto-completion-for-aliases)
- [Redirect command/script/application output](#redirect-commandscriptapplication-output)
- [Scripting](#scripting)
    - [`local` options](#local-options)
    - [Test expressions](#test-expressions)
    - [Shell Built-in `:`](#shell-built-in-)
    - [`[@]` and `[*]`](#-and-)
    - [`${}` and `$()`](#-and--1)
- [Variables in paths](#variables-in-paths)

## Interesting posts

- [What does the 'rc' in `.bashrc`, etc. mean? \[duplicate\]](https://superuser.com/questions/173165/what-does-the-rc-in-bashrc-etc-mean)

## Configuration files

*References*:

- [Difference Between .bashrc, .bash-profile, and .profile \| Baeldung on Linux](https://www.baeldung.com/linux/bashrc-vs-bash-profile-vs-profile)
- [unix - Choosing between .bashrc, .profile, .bash_profile, etc - Super User](https://superuser.com/questions/789448/choosing-between-bashrc-profile-bash-profile-etc)
- [bash - Difference between .bashrc and .bash_profile - Super User](https://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile)
- [linux - What are the functional differences between .profile .bash_profile and .bashrc - Server Fault](https://serverfault.com/questions/261802/what-are-the-functional-differences-between-profile-bash-profile-and-bashrc)

## History

### Customize history

I have the following configs in `.bashrc`:

```bash
# customize history (bash specific)
export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=ignoredups
```

*References*:

- [Remove and Avoid Duplicate Entries in Bash History \| Baeldung on Linux](https://www.baeldung.com/linux/history-remove-avoid-duplicates)
- [Bash – Using History Efficiently \| Baeldung on Linux](https://www.baeldung.com/linux/bash-using-history-efficiently)

## Alias

1. Add the following to `.bash_aliases`.

   ```bash
   alias MY_ALIAS_1='SOME_COMMAND_1'
   alias MY_ALIAS_2='SOME_COMMAND_2'
   ```

2. Add the following to `.bashrc`.

   ```bash
   # custom aliases
   if [ -f ~/.bash_aliases ]; then
      . ~/.bash_aliases
   fi
   ```

### Alias expansion

Press `Alt`+`Ctrl`+`E`.

*References*:

- [Print terminal alias command as well as executing it](https://stackoverflow.com/a/22612852)

### Auto-completion for aliases

1. Save [the attached script](./attachments/bash/.bash_aliases_completion) to `~/.bash_aliases_completion`.

2. Save the following to `.bashrc` **after** the alias section.

   ```bash
   if [ -f ~/.bash_aliases_completion ]; then
       . ~/.bash_aliases_completion
   fi
   ```

*References*:

- [cykerway/complete-alias: automagical shell alias completion;](https://github.com/cykerway/complete-alias)

## Redirect command/script/application output

Use `SOME_COMMAND 2>&1 | tee PATH/TO/FILE`.

*References*:

- [I/O Redirection](https://tldp.org/LDP/abs/html/io-redirection.html)
- [What are the shell's control and redirection operators? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/159513/what-are-the-shells-control-and-redirection-operators)
- [how to output text to both screen and file inside a shell script? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/80707/how-to-output-text-to-both-screen-and-file-inside-a-shell-script)
- [terminal - Display output from command and save to file - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/274168/display-output-from-command-and-save-to-file)
- [bash - echo that outputs to stderr - Stack Overflow](https://stackoverflow.com/questions/2990414/echo-that-outputs-to-stderr)
- [linux - Echo to both stdout and stderr - Stack Overflow](https://stackoverflow.com/questions/6852969/echo-to-both-stdout-and-stderr)
- [linux - Capturing STDERR and STDOUT to file using tee - Server Fault](https://serverfault.com/questions/201061/capturing-stderr-and-stdout-to-file-using-tee)

## Scripting

### `local` options

The option can be any option accepted by `declare`, which can be checked via `declare --help`.

### Test expressions

Use `man test` to check the exact expressions on the system.

*References*:

- [linux - What is the meaning of -n, -z, -x, -L, -d, etc... in Shell Script? - Stack Overflow](https://stackoverflow.com/questions/53319817/what-is-the-meaning-of-n-z-x-l-d-etc-in-shell-script)
- [Ubuntu Manpage: test - check file types and compare values](https://manpages.ubuntu.com/manpages/jammy/en/man1/test.1.html)

### Shell Built-in `:`

From Phind:

> The leading `:` in shell scripts is a no-op (no operation) command that can be used in various scenarios where you want to perform operations without actually executing a command. Here are some more use case examples:
>
> ### 1. Conditional Assignment
>
> You can use the `:` command to conditionally assign a value to a variable if it's not already set. This is similar to the use case you've seen but can be applied in different contexts.
>
> ```bash
> : "${VAR:=default_value}"
> ```
>
> This line checks if `VAR` is set and not null. If `VAR` is unset or null, it assigns `default_value` to `VAR`.
>
> ### 2. Conditional Execution of Commands
>
> You can use the `:` command to conditionally execute a command based on the value of a variable. This is useful when you want to perform an action only if a certain condition is met.
>
> ```bash
> if [ "$DEBUG" = "true" ]; then
>     : echo "Debug mode is enabled."
> fi
> ```
>
> In this example, the `echo` command is only executed if the `DEBUG` variable is set to `true`. The `:` command prevents the `echo` command from being executed directly, allowing the `if` statement to control the execution.
>
> ### 3. Silent Parameter Expansion
>
> You can use the `:` command to perform parameter expansions without executing a command. This is useful when you want to manipulate variables or perform operations based on their values.
>
> ```bash
> : "${VAR//pattern/replacement}"
> ```
>
> This line performs a parameter expansion that replaces `pattern` with `replacement` in `VAR`, but it doesn't execute any command. This can be useful for setting up variables or performing pre-processing steps.
>
> ### 4. Conditional Redirection
>
> You can use the `:` command to conditionally redirect output to a file. This is useful when you want to log output to a file only if a certain condition is met.
>
> ```bash
> if [ "$LOGGING" = "true" ]; then
>     : command > logfile.txt
> fi
> ```
>
> In this example, the output of `command` is redirected to `logfile.txt` only if the `LOGGING` variable is set to `true`. The `:` command prevents the redirection from being applied directly, allowing the `if` statement to control the redirection.
>
> ### 5. Conditional Evaluation of Expressions
>
> You can use the `:` command to conditionally evaluate expressions without executing a command. This is useful when you want to perform calculations or logical operations based on certain conditions.
>
> ```bash
> if [ "$CONDITION" = "true" ]; then
>     : $((VAR += 1))
> fi
> ```
>
> In this example, the value of `VAR` is incremented by 1 only if the `CONDITION` variable is set to `true`. The `:` command prevents the arithmetic operation from being executed directly, allowing the `if` statement to control the operation.
>
> These examples demonstrate the versatility of the `:` command in shell scripting, allowing for conditional execution, parameter expansion, and other operations without the need to execute a command.

### `[@]` and `[*]`

From Phind:

> In Bash, the `[@]` or `[*]` notation after an array variable is used to retrieve all elements from the array.
>
> - `${array[@]}`: This syntax expands to all the values of the array. Each value is treated as a separate word by the shell. This is useful when your array elements might contain spaces or other special characters.
> - `${array[*]}`: This syntax also expands to all the values of the array, but the values are treated as a single word by the shell.
>
> When you use `[@]` or `[*]` in double quotes like `"${array[@]}"` or `"${array[*]}"`, it preserves the whitespace within each element, which can be important if your array elements contain spaces.
>
> In your specific case, `${#files[@]}` is used to get the number of elements in the `files` array. The `[@]` is necessary to specify that you want the count of all elements in the array. If you just used `${#files}`, it would give you the length of the first element of the array, not the total number of elements.
>
> In the context of `${#files[@]}` or `${#files[*]}`, both `[@]` and `[*]` will give you the count of the total number of elements in the array. So, you can use either `${#files[@]}` or `${#files[*]}` to get the number of elements in the `files` array.
>
> The difference between `[@]` and `[*]` comes into play when you're expanding the array without the `#` operator. When quoted:
>
> - `"${array[@]}"` expands each item as a separate word. This is useful when your array elements might contain spaces or other special characters.
> - `"${array[*]}"` expands all items as a single word, with the first character of IFS acting as a separator.
>
> In your specific case, since you're just counting the number of elements in the array, it doesn't matter whether you use `[@]` or `[*]`.

Run the following snippet to see the difference:

```bash
#!/usr/bin/env bash
array=("element 1" "element 2" "element 3")

echo ${#array[@]}
echo ${#array[*]}

for e in "${array[@]}"; do
    echo "$e"
done

for e in ${array[@]}; do
    echo "$e"
done

for e in "${array[*]}"; do
    echo "$e"
done

for e in ${array[*]}; do
    echo "$e"
done
```

### `${}` and `$()`

From Phind:

> In Bash, the syntax `${}` is used for parameter expansion, which means it's used to manipulate the value of a variable (or parameter). The `#` inside `${}` is used to get the length of a variable or array.
>
> So, `${#files[@]}` is used to get the number of elements in the `files` array. The `[@]` is used to get all elements of the array, and the `#` is used to count them.
>
> On the other hand, `$()` is used for command substitution. It runs the command inside the parentheses and replaces the command with its output. So, `$(#files[@])` would try to run `#files[@]` as a command, which is not valid syntax.
>
> In summary, `${}` and `$()` are used for different things in Bash. `${}` is used for parameter expansion, which includes things like getting the length of a variable or array, while `$()` is used for command substitution.

## Variables in paths

Use `${FOO:?}/${BAR:?}` instead of `$FOO/$BAR` to ensure this never expands to `/*`.

*References*:

- [ShellCheck: SC2115 – Use `"${var:?}"` to ensure this never expands to `/*` .](https://www.shellcheck.net/wiki/SC2115)
