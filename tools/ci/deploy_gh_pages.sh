#!/bin/bash -eu

BASE_DIR=$(dirname $0)
cd ${BASE_DIR}/../..

configure_git() {
    git config --global user.email $(git log --format="%aE" HEAD | head -1)
    git config --global user.name ${CIRCLE_USERNAME}
}

checkout_gh_pages() {
    git fetch origin
    if [ -z "$(git branch -a | grep remotes/origin/gh-pages)" ]; then
        git checkout -b gh-pages
        git rm --cached -r .
        # git symbolic-ref HEAD refs/heads/master
    else
        git checkout gh-pages
        # git symbolic-ref HEAD refs/heads/gh-pages
    fi
    git reset
}

copy_site_to_root() {
    if [ ! -d public/site ]; then
        echo "site directory doesn't exist."
        exit 1
    fi
    cp -r public/site/* ./
}

deploy_site_gh_pages() {
    local SITE_FILES=$(find public/site -type f | sed -n 's@^public/site/\(.*\)$@\1@p')
    for SITE_FILE in ${SITE_FILES[@]}
    do
        git add ${SITE_FILE}
    done
    
    local DEPLOY_IGNORE_FILES=( public tools README.md requirements.txt .circleci .gitignore )
    for DEPLOY_IGNORE_FILE in ${DEPLOY_IGNORE_FILES[@]}
    do
        if [ $(git ls-files | grep -Eo "${DEPLOY_IGNORE_FILE}" | wc -l) -gt 0 ]; then
            git rm --cached -r ${DEPLOY_IGNORE_FILE}
            rm -rf ${DEPLOY_IGNORE_FILE}
        fi
    done

    if [ -n "$(git diff --cached --exit-code)" ]; then
        local CI_RELEASE_DATE=`date +"%Y%m%d%H%M%S"`
        git commit -m "ci: Published ${CI_RELEASE_DATE}"

        local CI_REMOTE_REPOSITORY="https://github.com/${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME}"
        git push ${CI_REMOTE_REPOSITORY} "gh-pages"
    fi
    git checkout -
}

configure_git
checkout_gh_pages
copy_site_to_root
deploy_site_gh_pages

exit 0
