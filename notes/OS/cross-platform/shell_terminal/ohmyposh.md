# Oh My Posh Config

## My Config

Save the following to `Documents\\PowerShell\\.mytheme.omp.json`:

{% raw %}

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

{% endraw %}

Save the following to `Documents\\PowerShell\\profile.ps1`:

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
