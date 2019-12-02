#!/bin/bash

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
