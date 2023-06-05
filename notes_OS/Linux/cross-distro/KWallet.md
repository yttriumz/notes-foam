# KWallet

*References*:

- [the official doc]( https://docs.kde.org/trunk5/en/kwalletmanager/kwallet5/index.html ) ([PDF version]( https://docs.kde.org/stable5/en/kwalletmanager/kwallet5/kwallet5.pdf ))
- [Arch wiki]( https://wiki.archlinux.org/title/KDE_Wallet )

## Blowfish and GPG

Some references:

- [Why don't we use Blowfish if it hasn't been cracked?](https://crypto.stackexchange.com/questions/87278/why-dont-we-use-blowfish-if-it-hasnt-been-cracked)
- [Kwallet and KMail: What’s GPG? What’s Blowfish? Why a Blank Password?](https://forums.opensuse.org/t/kwallet-and-kmail-whats-gpg-whats-blowfish-why-a-blank-password/113770)

## KWallet and VSCode

The simplest method: create a wallet in KWallet and use a blank password.

**NOTE**: At the time of writing (*Tumbleweed 20230225*, *KDE Plasma 5.27.1*), if no other application uses KWallet (e.g. not encrypting any WiFi password with KWallet), then KWallet might not automatically open the wallet at user login, which will cause VSCode authentication failure. But you can still config the KWallet to auto-unlock referring to [the post]( https://gist.github.com/Trucido/b788017a18e1189e6703e42315e8829c ).

*References*:

- [Settings Sync#Troubleshooting keychain issues](https://code.visualstudio.com/docs/editor/settings-sync#_linux)
- [KDE WALLET](https://github.com/microsoft/vscode/issues/104319)
