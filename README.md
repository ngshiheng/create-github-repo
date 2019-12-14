# Git Jidoka :hammer:

**Current Feature:**
- Create a repository on your GitHub
- Committed too frequently? Made a minor mistake on your commit? Squash everything into a single commit!

![alt text](https://i.imgur.com/FxLZJJH.png)

## Setup :wrench:

1. Setup SSH [here](https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

2. Create a personal access token for GitHub [here](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line)

3. Clone this repository and run `./setup.sh` to source and copy the `.git-jidoka-script.sh` to your home directory (`cd`). Or you can do this manually

4. Source the bash script and add your personal access token into your `~/.bashrc`. Example:

```bash
# Change the GITHUB_API_TOKEN accordingly and the line below inside your ~/.bashrc (This is just a dummy token)
export GITHUB_API_TOKEN=fac086307dab129b81ca11a842bb94acd0d98f99
source ~/.git-jidoka-script.sh
```


## Usage example :page_with_curl:

### I'm too lazy to click buttons: create a repository on GitHub with a single command
```bash
git-create-project
```

### My commit history doesn't make sense, I need a fresh start. Make sure you run this command at your work branch
```bash
git-squash master work-branch-name
```

## Contributing :construction_worker:

1. Fork this
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

## License :copyright:

Copyright 2019 Jerry Ng

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
