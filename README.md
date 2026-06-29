# jaenster/homebrew-tap

Homebrew formulae for [jaenster](https://github.com/jaenster) projects.

## hush

A macOS-local secrets daemon — *ssh-agent, but for environment variables*.
See [github.com/jaenster/hush](https://github.com/jaenster/hush).

```sh
brew install jaenster/tap/hush

# start the daemon (and keep it running on login)
brew services start hush

hush set dev API_KEY s3cr3t
hush -- node server.js
```

Binaries are not yet notarized. If macOS Gatekeeper blocks them, run:

```sh
xattr -dr com.apple.quarantine "$(brew --prefix)/bin/hush" "$(brew --prefix)/bin/hushd"
```
