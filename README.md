# Git Jidoka :hammer:

**Current Feature:**

- Create a repository on your GitHub
- Committed too frequently? Made a minor mistake on your commit? Squash everything into a single commit!

![alt text](https://i.imgur.com/FxLZJJH.png)

## Setup :wrench:

1. Setup SSH [here](https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

2. Create a personal access token for GitHub [here](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line)

3. Clone this repository and run `./setup.sh` to source `.git-jidoka-script.sh`

4. Source the bash script and add your personal access token into your `~/.bashrc` or `~/.zshrc`. Example:

```bash
# Change the GITHUB_API_TOKEN accordingly and the line below inside your ~/.bashrc (Note: this is just a dummy token)
export GITHUB_API_TOKEN=fac086307dab129b81ca11a842bb94acd0d98f99
```

## Usage example :page_with_curl:

#### I'm too lazy to click buttons: create a repository on GitHub with a single command

```bash
git-create-project
```

#### My commit history doesn't make sense, I need a fresh start. Make sure you run this command at your work branch

```bash
git-squash master feature/fooBar
```

## Contributing :construction_worker:

1. Fork this
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request
