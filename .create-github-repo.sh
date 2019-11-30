#! /bin/bash

start-git-project() {

    # --- Functions --- #
    make_local_dir() {
        echo "📂 Creating new project folder <$REPOSITORY_NAME> "
        mkdir ${REPOSITORY_NAME}
        cd ${REPOSITORY_NAME}
        git init
        echo "📄 Creating empty .gitignore & README.md"
        touch .gitignore README.md
    }

    create_setup_git_repo() {
        echo "🛠  Creating public repository <$REPOSITORY_NAME>"
        curl -i -X POST https://api.github.com/user/repos \
            -H "Authorization: token $GITHUB_API_TOKEN " \
            -d "{\"name\":\"$REPOSITORY_NAME\", \"auto_init\": false, \"private\":false, \"license_template\":\"mit\"}"
        git remote add origin git@github.com:$USERNAME/$REPOSITORY_NAME.git
        git pull origin master
        git add .gitignore README.md
        git commit -m "First commit"
        git push --set-upstream origin master
    }

    # --- Main --- #

    read -p "📝 Enter your new public repository name: " REPOSITORY_NAME
    read -p "🐱 Enter your GitHub username: " USERNAME
    read -p "❓ Confirm to create public repository <$REPOSITORY_NAME> on GitHub? (Press <y/N> to continue) "
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        make_local_dir
        create_setup_git_repo
        echo "👌 Done"
    else
        echo "👋 Bye"
    fi
}
