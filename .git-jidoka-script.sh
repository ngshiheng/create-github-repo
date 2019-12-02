#!/bin/bash

# Automate repository creation on GitHub
git-create-project() {

    # --- Functions --- #
    mk_cd_local_dir() {
        echo "📂 Creating new project folder <$REPOSITORY_NAME> "
        mkdir ${REPOSITORY_NAME}
        cd ${REPOSITORY_NAME}
        git init
        echo "📄 Creating empty .gitignore & README.md"
        touch .gitignore README.md
    }

    github_login_create_repository() {
        echo "👦 Logging in & creating public repository <$REPOSITORY_NAME>"
        curl -u "$USERNAME:$GITHUB_API_TOKEN" https://api.github.com/user/repos \
            -d "{\"name\":\"$REPOSITORY_NAME\"}"
    }

    github_push_first_commit() {
        echo "🛠 Commiting & pushing README.md & .gitiginore"
        git remote add origin git@github.com:$USERNAME/$REPOSITORY_NAME.git
        git add .gitignore README.md
        git commit -m "First commit"
        git push --set-upstream origin $ref_branch
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

# My commit history doesn't make sense, I need a fresh start
git-squash() {
    ref_branch=$1
    work_branch=$2

    # At work_branch
    git pull origin $ref_branch

    # At $ref_branch branch
    git checkout $ref_branch
    git pull origin $ref_branch
    git diff $ref_branch $work_branch >~/$work_branch.patch

    # Create a backup branch
    git branch -m $work_branch $work_branch-BAK
    git checkout -b $work_branch
    git apply ~/$work_branch.patch
    git status

    echo "👍 Done"
}
