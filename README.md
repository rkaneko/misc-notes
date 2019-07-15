<h1 align="center">misc notes</h1>

<p align="center">rkaneko's miscellaneous notes.</p>

<br>

[![License: MIT][license]](https://opensource.org/licenses/MIT)
[![build status][circleci-image]][circleci-url]
[![python][python]]()
[![mkdocs][mkdocs-badge]][gh-pages-url]

#### Prerequisites

```bash
$ pip install --user pipenv
```

### Usage

- Pipenv & virtualenv

```bash
# use pipenv virtualenv
$ PIPENV_VENV_IN_PROJECT=true pipenv shell

# install dependencies
$ pipenv install --dev
```

- Mkdocs

```bash
# build mkdocs
$ pipenv run build

# serve on local environment
$ pipenv run serve:dev
# Access http://localhost:8000/
```

### Deployment

- Create a merge request to `master` branch
- After merging that MR to `master`, then CircleCI will deploy on GitHub pages.

#### Configuration for deploying using circleci

- See [Deploying documentation to GitHub Pages with continuous integration @ circleci.com/blog](https://circleci.com/blog/simplifying-your-ci-cd-build-pipeline-to-gke-with-circleci-orbs/)
  - Generate ssh key pair using `ssh-keygen`.
  - Add a private ssh key to [CircleCI SSH Permissions](https://circleci.com/gh/rkaneko/misc-notes/edit#ssh)
  - Add a public ssh key to [GitHub project settings/keys](https://github.com/rkaneko/misc-notes/settings/keys)
  - Add git config commands and `add_ssh_keys` operation to [.circleci/config.yml](.circleci/config.yml)


[circleci-image]: https://circleci.com/gh/rkaneko/misc-notes.svg?style=shield&logo=circleci
[circleci-url]: https://circleci.com/gh/rkaneko/misc-notes
[license]: https://img.shields.io/badge/licence-MIT-blue.svg
[python]: https://img.shields.io/badge/-Python-F9DC3E.svg?logo=python&style=flat
[mkdocs-badge]: https://img.shields.io/badge/mkdocs--4FC08D.svg?logo=markdown&style=plastic
[gh-pages-url]: https://rkaneko.github.io/misc-notes/
