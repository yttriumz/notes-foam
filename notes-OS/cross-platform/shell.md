# Shell Related

## Oh My Posh

*References*:

- [the official doc](https://ohmyposh.dev/docs/installation/customize)

### My Config

1. Save the following to `Documents\\PowerShell\\.mytheme.omp.json`:

    {% raw %}

    <details>

    ```json
    {
    "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
    "blocks": [
        {
        "alignment": "left",
        "segments": [
            {
            "background": "#a313a8",
            "foreground": "#FFEB3B",
            "style": "plain",
            "template": " \uf0e7 ",
            "type": "root"
            },
            {
            "background": "transparent",
            "foreground": "#ffffff",
            "style": "plain",
            "template": " {{ if .WSL }}WSL at {{ end }}{{.Icon}} ",
            "type": "os"
            },
            {
            "background": "#01579B",
            "foreground": "#ffffff",
            "powerline_symbol": "\ue0b0",
            "properties": {
                "folder_icon": "\uf6d7",
                "home_icon": "\uf7db",
                "style": "agnoster"
            },
            "style": "powerline",
            "template": " {{ .Path }} ",
            "type": "path"
            },
            {
            "background": "#00C853",
            "background_templates": [
                "{{ if or (.Working.Changed) (.Staging.Changed) }}#FFEB3B{{ end }}",
                "{{ if and (gt .Ahead 0) (gt .Behind 0) }}#FFCC80{{ end }}",
                "{{ if gt .Ahead 0 }}#B388FF{{ end }}",
                "{{ if gt .Behind 0 }}#B388FF{{ end }}"
            ],
            "foreground": "#000000",
            "powerline_symbol": "\ue0b0",
            "properties": {
                "fetch_stash_count": true,
                "fetch_status": true
            },
            "style": "powerline",
            "template": " {{ .HEAD }}{{ .BranchStatus }}{{ if .Staging.Changed }}<#FF6F00> \uf046 {{ .Staging.String }}</>{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if gt .StashCount 0 }} \uf692 {{ .StashCount }}{{ end }} ",
            "type": "git"
            },
            {
            "background": "#49404f",
            "foreground": "#ffffff",
            "powerline_symbol": "\ue0b0",
            "properties": {
                "style": "dallas",
                "threshold": 0
            },
            "style": "powerline",
            "template": " {{ .FormattedMs }}s ",
            "type": "executiontime"
            },
            {
            "background": "#910000",
            "foreground": "#ffffff",
            "powerline_symbol": "\ue0b0",
            "style": "powerline",
            "template": "<transparent> \uf12a</> {{ .Meaning }} ",
            "type": "exit"
            }
        ],
        "type": "prompt"
        },
        {
        "alignment": "right",
        "segments": [
            {
            "background": "#29315A",
            "foreground": "#43CCEA",
            "style": "diamond",
            "template": "{{ if and ( eq .UserName \"yzhao\" ) ( eq .HostName \"az-P1-Win10\" ) }} {{ else }} {{ .UserName }}<transparent> @ </>{{ .HostName }} {{ end }}",
            "type": "session"
            },
            {
            "background": "#29315A",
            "foreground": "#3EC669",
            "properties": {
                "time_format": "15:04:05"
            },
            "style": "plain",
            "template": "<transparent> \uf64f </>{{ .CurrentDate | date .Format }} ",
            "type": "time"
            }
        ],
        "type": "prompt"
        },
        {
        "alignment": "left",
        "newline": true,
        "segments": [
            {
            "foreground": "#ffffff",
            "foreground_templates": [
                "{{ if gt .Code 0 }}#ff0000{{ end }}"
            ],
            "properties": {
                "always_enabled": true
            },
            "style": "plain",
            "template": "{{ if .Root }} \uf0e7 {{ else }} \u276f {{ end }}",
            "type": "exit"
            }
        ],
        "type": "prompt"
        }
    ],
    "console_title_template": "{{if .Root}} \u26a1 {{end}}{{.Folder | replace \"~\" \"🏚\" }} @ {{.HostName}}",
    "osc99": true,
    "version": 2
    }
    ```

    </details>

    {% endraw %}

2. Save the following to `Documents\\PowerShell\\profile.ps1`:

    <details>

    ```powershell
    # oh-my-posh init pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/blue-owl.omp.json | Invoke-Expression
    # oh-my-posh init pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/capr4n.omp.json | Invoke-Expression
    # oh-my-posh init pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/gmay.omp.json | Invoke-Expression
    # oh-my-posh init pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/montys.omp.json | Invoke-Expression
    # oh-my-posh init pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/powerlevel10k_classic.omp.json | Invoke-Expression
    # oh-my-posh init pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/powerlevel10k_rainbow.omp.json | Invoke-Expression
    # oh-my-posh init pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/takuya.omp.json | Invoke-Expression
    # oh-my-posh init pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/thecyberden.omp.json | Invoke-Expression
    oh-my-posh init pwsh --config 'PATH_TO/.mytheme.omp.json' | Invoke-Expression
    # Invoke-Expression (&starship init powershell)
    ```

    </details>

## Starship

*References*:

- [Configuration](https://starship.rs/config/)

### My Config

Save the following to `~/.config/starship.toml`:

<details>

```toml
# Get editor completions based on the config schema
"$schema" = 'https://starship.rs/config-schema.json'

#format = """
#[╭─user───❯](bold blue) $username
#[┣─system─❯](bold yellow) $hostname
#[┣─project❯](bold red) $directory$rust$git_branch$git_status$package$golang$terraform$docker_context$python$docker_context$nodejs
#[╰─cmd────❯](bold green)
#"""

[username]
style_user = "green bold"
style_root = "red bold"
format = "[$user]($style)"
disabled = false
show_always = true


[hostname]
ssh_only = false
format = '@[$hostname](bold yellow) '
trim_at = "."
disabled = false

# Replace the "❯" symbol in the prompt with "➜"
[character]                            # The name of the module we are configuring is "character"
success_symbol = "[﬌](bold green)"     # The "success_symbol" segment is being set to "➜" with the color "bold green"
error_symbol = "[✗](bold red)"
#  

# configure directory
[directory]
read_only = " "
truncation_length = 10
truncate_to_repo = true # truncates directory to root folder if in github repo
style = "bold italic blue"

[cmd_duration]
min_time = 4
show_milliseconds = false
disabled = false
style = "bold italic red"

[aws]
symbol = "  "

[conda]
symbol = " "

[dart]
symbol = " "

[docker_context]
symbol = " "
format = "via [$symbol$context]($style) "
style = "blue bold"
only_with_files = true
detect_files = ["docker-compose.yml", "docker-compose.yaml", "Dockerfile"]
detect_folders = []
disabled = false

[elixir]
symbol = " "

[elm]
symbol = " "

[git_branch]
symbol = " "

[golang]
symbol = " "

[hg_branch]
symbol = " "

[java]
symbol = " "

[julia]
symbol = " "

[memory_usage]
symbol = " "

[nim]
symbol = " "

[nix_shell]
symbol = " "

[package]
symbol = " "

[perl]
symbol = " "

[php]
symbol = " "

[python]
symbol = " "
#pyenv_version_name = true
format = 'via [${symbol}python (${version} )(\($virtualenv\) )]($style)'
style = "bold yellow"
pyenv_prefix = "venv "
python_binary = ["./venv/bin/python", "python", "python3", "python2"]
detect_extensions = ["py"]
version_format = "v${raw}"

[ruby]
symbol = " "

[rust]
symbol = " "

[scala]
symbol = " "

[shlvl]
symbol = " "

[swift]
symbol = "ﯣ "

[nodejs]
format = "via [ Node.js $version](bold green) "
detect_files = ["package.json", ".node-version"]
detect_folders = ["node_modules"]
```

</details>
