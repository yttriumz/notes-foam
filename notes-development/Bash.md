---
sitemap:
  lastmod: 2024-11-04 +0000
---

# Bash Scripting

Last modified: 2024-11-04 +0000

- [Interesting posts](#interesting-posts)
- [Redirect command/script/application output](#redirect-commandscriptapplication-output)
- [`local` options](#local-options)
- [Test expressions](#test-expressions)
- [Shell built-in `:`](#shell-built-in-)
- [`[` and `[[`](#-and-)
- [`[@]` and `[*]`](#-and--1)
- [`${}` and `$()`](#-and--2)
- [Variables in paths](#variables-in-paths)
- [Error handling](#error-handling)

## Interesting posts

- [console - How does one output bold text in Bash? - Stack Overflow](https://stackoverflow.com/questions/2924697/how-does-one-output-bold-text-in-bash)
- [Bash is a terrible as a programming language, but what's the alternative ? - DEV Community](https://dev.to/jmfayard/bash-is-a-terrible-programming-language-but-whats-the-alternative--oc2)
- [A Second Search for Bash Scripting Alternatives - Monzool's Personal Publishing](https://monzool.net/blog/2024/07/14/a-second-search-for-bash-scripting-alternatives/)
- [what would you use to replace Bash for scripting? - Page 1](https://www.eevblog.com/forum/programming/what-would-you-use-to-replace-bash-for-scripting/)
- [xonsh/xonsh: :shell: Python-powered shell. Full-featured and cross-platform.](https://github.com/xonsh/xonsh)

Documentation & tutorials:

- [Top (Bash Reference Manual)](https://www.gnu.org/software/bash/manual/html_node/)
  - [Brace Expansion (Bash Reference Manual)](https://www.gnu.org/software/bash/manual/html_node/Brace-Expansion.html)
  - [Shell Parameter Expansion (Bash Reference Manual)](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html)
  - [Pattern Matching (Bash Reference Manual)](https://www.gnu.org/software/bash/manual/html_node/Pattern-Matching.html)
- [ShellCheck: SC2097 – This assignment is only seen by the forked process.](https://www.shellcheck.net/wiki/SC2097)
- [Intro – Modern Bash (Zsh) Scripting](https://www.mulle-kybernetik.com/modern-bash-scripting/)

- Miscellaneous:

- [linux - What's the different between 'cat > some_file << EOF some_stuff EOF' and 'echo "some_stuff" > some_file' - Super User](https://superuser.com/questions/1434549/whats-the-different-between-cat-some-file-eof-some-stuff-eof-and-echo)
- [What's the difference between cat /dev/null>file and echo"">file ? : r/bash](https://www.reddit.com/r/bash/comments/s397ao/whats_the_difference_between_cat_devnullfile_and/)
- [bash - iterate over file and send lines as positional parameters to another file - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/177491/iterate-over-file-and-send-lines-as-positional-parameters-to-another-file)
- [files - How do I loop through only directories in bash? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/86722/how-do-i-loop-through-only-directories-in-bash)
- [bash - How are parentheses interpreted at the command line? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/26063/how-are-parentheses-interpreted-at-the-command-line)
- [linux - How can I run a function from a script in command line? - Stack Overflow](https://stackoverflow.com/questions/8818119/how-can-i-run-a-function-from-a-script-in-command-line)
- [How to evaluate a boolean variable in an if block in bash? - Stack Overflow](https://stackoverflow.com/questions/3810709/how-to-evaluate-a-boolean-variable-in-an-if-block-in-bash)
- [How to Declare Bash Boolean Variable in a Shell Script](https://kodekloud.com/blog/declare-bash-boolean-variable-in-shell-script/)
- [How do you run multiple programs in parallel from a bash script? - Stack Overflow](https://stackoverflow.com/questions/3004811/how-do-you-run-multiple-programs-in-parallel-from-a-bash-script)
- [shell script - Parallelize a Bash FOR Loop - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/103920/parallelize-a-bash-for-loop)
- [Exporting an array in bash script - Stack Overflow](https://stackoverflow.com/questions/5564418/exporting-an-array-in-bash-script)
- [How to Get the Directory Where a Bash Script is Located \| Saturn Cloud Blog](https://saturncloud.io/blog/how-to-get-the-directory-where-a-bash-script-is-located/)

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

## `local` options

The option can be any option accepted by `declare`, which can be checked via `declare --help`.

## Test expressions

Use `man test` to check the exact expressions on the system.

*References*:

- [linux - What is the meaning of -n, -z, -x, -L, -d, etc... in Shell Script? - Stack Overflow](https://stackoverflow.com/questions/53319817/what-is-the-meaning-of-n-z-x-l-d-etc-in-shell-script)
- [Ubuntu Manpage: test - check file types and compare values](https://manpages.ubuntu.com/manpages/jammy/en/man1/test.1.html)
- [Check If a Variable Is Empty in Bash: Shell Script How-to](https://ioflood.com/blog/bash-if-variable-is-empty/)
- [linux - How to check if a file is empty in Bash? - Stack Overflow](https://stackoverflow.com/questions/9964823/how-to-check-if-a-file-is-empty-in-bash)

## Shell built-in `:`

*References*:

- [shell - What is the purpose of the : (colon) GNU Bash builtin? - Stack Overflow](https://stackoverflow.com/questions/3224878/what-is-the-purpose-of-the-colon-gnu-bash-builtin)

## `[` and `[[`

*References*:

- [scripting - What is the difference between double and single square brackets in bash? - Server Fault](https://serverfault.com/questions/52034/what-is-the-difference-between-double-and-single-square-brackets-in-bash)

## `[@]` and `[*]`

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

## `${}` and `$()`

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

## Error handling

From ChatGPT (Poe):

> The line `set -Eeuo pipefail` at the beginning of a Bash script is commonly used to set specific options for error handling and control within the script. Here's a breakdown of each option:
>
> - `set -E`: Enables the shell's "errtrace" option. This option ensures that any trap on ERR is inherited by shell functions, subshells, and commands executed in a command substitution.
>
> - `set -e`: Enables the "errexit" option. If any command in the script exits with a non-zero status (indicating failure), the script will immediately exit as well. This helps to ensure the script stops execution upon encountering errors.
>
>   However, it's important to note that there are cases where you might want to handle errors differently or allow certain commands to fail without terminating the script. In such situations, you can use constructs like `|| true` after a command to prevent the script from exiting on failure for that specific command.
>
>   For example:
>
>   ```bash
>   command_that_may_fail || true
>   ```
>
>   By appending `|| true` to the command, even if it fails, the script will continue executing instead of terminating. This allows you to customize the error handling behavior on a case-by-case basis.
>
> - `set -u`: Enables the "nounset" option. It treats unset variables as an error and causes the script to exit if an attempt is made to use an uninitialized variable. This helps to catch potential programming mistakes.
>
> - `set -o pipefail`: Sets the "pipefail" option. By default, when a command in a pipeline fails, the shell only checks the exit status of the last command in the pipeline. However, with `pipefail` set, the entire pipeline's exit status is determined by the last command that fails, allowing for better error handling in pipelines.
>
> These options collectively help to improve the robustness and reliability of Bash scripts by enforcing stricter error handling and preventing the use of uninitialized variables. They can be particularly useful in ensuring that scripts terminate early upon encountering errors and provide more accurate exit statuses for pipelines.

From ChatGPT (Poe):

> If you want to print error messages when a command returns a non-zero status and then exit the script, you can achieve this by using the `set -e` option along with explicit error handling. Here's an example:
>
> ```bash
> #!/bin/bash
>
> set -e
>
> # Function to print error message and exit
> print_error_and_exit() {
>     local exit_code=$1
>     local message=$2
>
>     echo "Error: $message"
>     exit $exit_code
> }
>
> # Example commands
> command1 || print_error_and_exit $? "Command 1 failed"
> command2 || print_error_and_exit $? "Command 2 failed"
> command3 || print_error_and_exit $? "Command 3 failed"
>
> # Rest of the script continues if all commands succeed
> echo "All commands executed successfully"
> ```
>
> In this script, the `set -e` option is enabled to exit the script immediately if any command returns a non-zero status.
>
> To handle errors and print error messages, a `print_error_and_exit` function is defined. This function takes two parameters: the exit code and the error message. It prints the error message and exits the script with the provided exit code.
>
> After each command that may fail, the script uses the `||` operator to execute the `print_error_and_exit` function if the command returns a non-zero status. The `$?` variable captures the exit code of the previous command, which is then passed to the `print_error_and_exit` function along with an appropriate error message.
>
> By using this approach, you can print error messages when commands fail and exit the script in a controlled manner.

From ChatGPT (Poe):

> If you have a large number of commands and appending `|| print_error_and_exit $? "Command X failed"` to each one is not optimal, you can make use of a subshell and the `trap` command to handle errors globally. Here's an example:
>
> ```bash
> #!/bin/bash
>
> set -e
>
> # Function to print error message and exit
> print_error_and_exit() {
>     local exit_code=$1
>     local message=$2
>
>     echo "Error: $message"
>     exit $exit_code
> }
>
> # Trap command to handle errors
> trap 'print_error_and_exit $? "Command failed"' ERR
>
> # Example commands
> (
>     command1
>     command2
>     command3
>     # Add more commands here
> )
>
> # Rest of the script continues if all commands succeed
> echo "All commands executed successfully"
> ```
>
> In this script, the `trap` command is used to set up an error handler. The `ERR` signal is trapped, and whenever a command within the subshell (enclosed in parentheses) returns a non-zero status, the `print_error_and_exit` function is called with the exit code (`$?`) and an error message.
>
> By enclosing the commands in a subshell, you can handle errors globally for all the commands within it. If any command within the subshell fails, the `ERR` trap will be triggered, and the error handler function will be executed.
>
> This approach avoids the need to append `|| print_error_and_exit $? "Command X failed"` to each command individually, making it more manageable for scripts with many commands.
>
> Note that the `set -e` option is still necessary to enable the script to exit immediately upon encountering an error outside of the subshell.

*References*:

- [Bash Scripting: Error Handling and Debugging Techniques \| by AI Instructor \| Medium](https://medium.com/@aiinstructor/bash-scripting-error-handling-and-debugging-techniques-739f5d6dbc2b)
- [Error handling in Bash scripts \| Enable Sysadmin](https://www.redhat.com/sysadmin/error-handling-bash-scripting)
- [Learn Bash error handling by example \| Enable Sysadmin](https://www.redhat.com/sysadmin/bash-error-handling)
- [Part 10 - Mastering Error Handling in Bash: Safeguard Your Scripts with Effective Error Management! ⚠️](https://www.linkedin.com/pulse/part-10-mastering-error-handling-bash-safeguard-your?trk=organization_guest_main-feed-card_feed-article-content)
- [Writing Bash Scripts Like A Pro - Part 2 - Error Handling - DEV Community](https://dev.to/unfor19/writing-bash-scripts-like-a-pro-part-2-error-handling-46ff)
