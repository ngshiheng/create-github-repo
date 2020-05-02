#!/bin/sh

LICENSE_GIST="https://gist.githubusercontent.com/ngshiheng/3f016ed77515a9282bd1375cc89a1690/raw/1e9d3d9d6a303217ad83fb4e3e1151bb0f93de22/LICENSE"
README_GIST="https://gist.githubusercontent.com/ngshiheng/7c3e91235c3ea11865472ef5116dc5c1/raw/879e5f5fb2fec31cb534306c61eccc5512b0ea26/README.md"

# Test if the script is reloaded
jidoka-test() {
    export TZ="Asia/Singapore"
    echo "Hello world! The current time is: $(date +"%d-%B-%Y %r")"
}

# I'm too lazy to click buttons: create a repository on GitHub with a single command
git-create-project() {
    mk_cd_local_dir() {
        echo "📂 Creating new project folder <$REPOSITORY_NAME> "
        mkdir "${REPOSITORY_NAME}"
        cd "${REPOSITORY_NAME}" || exit
        git init
        echo "📄 Creating empty .gitignore, README.md template and a MIT LICENSE file"
        touch .gitignore
        curl "$README_GIST" >README.md
        curl "$LICENSE_GIST" >LICENSE

    }

    github_login_create_repository() {
        echo "👦 Logging in & creating public repository <$REPOSITORY_NAME>"
        curl -u "$USERNAME:$GITHUB_API_TOKEN" https://api.github.com/user/repos \
            -d "{\"name\":\"$REPOSITORY_NAME\"}"
    }

    github_push_first_commit() {
        echo "🛠 Commiting & pushing README.md & .gitiginore"
        git remote add origin git@github.com:"$USERNAME"/"$REPOSITORY_NAME".git
        git add .gitignore README.md
        git commit -m "First commit"
        git push --set-upstream origin master
    }

    # --- Main --- #
    read -p "📝 Enter your new public repository name: " REPOSITORY_NAME
    read -p "🐱 Enter your GitHub username: " USERNAME
    read -p "❓ Confirm to create public repository <$REPOSITORY_NAME> on GitHub? (Press <y/N> to continue) "
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        mk_cd_local_dir
        github_login_create_repository
        github_push_first_commit
        echo "👌 Done. Current directory: <$PWD>"
    else
        echo "👋 Bye"
    fi
}

# My commit history doesn't make sense, I need a fresh start. Make sure you run this command at your work branch
git-squash() {
    ref_branch=$1
    work_branch=$2

    # At work_branch
    git branch -D "$work_branch"-BAK

    # At ref_branch
    git checkout "$ref_branch"
    git pull origin "$ref_branch"

    # At work_branch
    git checkout "$work_branch"
    git rebase origin/"$ref_branch"

    # At ref_branch
    git checkout "$ref_branch"
    git diff "$ref_branch" "$work_branch" >~/"$work_branch".patch

    # Create a backup branch
    git branch -m "$work_branch" "$work_branch"-BAK
    git checkout -b "$work_branch"
    git apply ~/"$work_branch".patch
    git status
    echo "👍 Done"
}

kickstart-node() {
    # Feel free to change yarn to npm
    mkdir "$1" && cd "$1" && git init && yarn init -y
    curl https://raw.githubusercontent.com/github/gitignore/master/Node.gitignore >.gitignore
    curl "$README_GIST" >README.md
    curl "$LICENSE_GIST" >LICENSE
    code .
    echo "Let's build something awesome with Node.js! 💪"
}

kickstart-python() {
    mkdir "$1" && cd "$1" && git init && pipenv shell
    curl https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore >.gitignore
    curl "$README_GIST" >README.md
    curl "$LICENSE_GIST" >LICENSE
    code .
    echo "Ready to build something cool with Python? 🐍"
}
