# hykes-blueprinter <sub><sup>| Cloud Elements cloud blueprint utility</sup></sub>
[![version](http://img.shields.io/badge/version-v0.0.1-blue.svg)](CHANGELOG.md)
[![versioning](http://img.shields.io/badge/versioning-semver-blue.svg)](http://semver.org)
[![branching](http://img.shields.io/badge/branching-github%20flow-blue.svg)](https://guides.github.com/introduction/flow/)
[![license](http://img.shields.io/badge/license-apache-blue.svg)](LICENSE.md)
[![pm](http://img.shields.io/badge/pm-zenhub-blue.svg)](https://www.zenhub.io)
[![docs](http://img.shields.io/badge/docs-repo-blue.svg)](https://github.com/cloud-elements/hykes-docs)
[![chat](http://img.shields.io/badge/chat-slack-blue.svg)](https://ce-success.herokuapp.com)
[![circleci](https://circleci.com/gh/cloud-elements/hykes-blueprinter.svg?style=shield)](https://circleci.com/gh/cloud-elements/hykes-blueprinter)

## Installation

### Via Homebrew:

```bash
# Install via tap:
$ brew tap cloud-elements/hykes
$ brew install hykes-blueprinter

# Initialize:
$ hykes-blueprinter init
```

### Via PPA:

In development

### Via compiling from source:

```bash
$ git clone git@github.com:cloud-elements/hykes-blueprinter.git
$ cd hykes-blueprinter
$ make
$ make install
$ build/bin/hykes-blueprinter init
```

> __PROTIP:__
You are responsible for ensuring all dependencies are installed, including transitive dependencies.
Examine [circle.yml](circle.yml) for a detailed example of the steps needed to compile from source
on Ubuntu.

## Usage

```bash
$ hykes-blueprinter --help
Usage:
  hykes-blueprinter decrypt <password> [--quiet|-q]
  hykes-blueprinter decrypted [--quiet|-q]
  hykes-blueprinter encrypt <password> [--quiet|-q]
  hykes-blueprinter encrypted [--quiet|-q]
  hykes-blueprinter init <path> [url] [--quiet|-q]
  hykes-blueprinter list-servers [role] [--quiet|-q]

Configuration Commands:
  init    Initialize to work against the given blueprint

Cryptography Commands:
  decrypt      Decrypt blueprint
  decrypted    Output boolean indicating if decrypted
  encrypt      Encrypt blueprint
  encrypted    Output boolean indicating if encrypted

Discovery Commands:
  list-servers    Output unfurled servers from blueprint inventory

More Information:
  chat    https://ce-success.herokuapp.com
  docs    https://github.com/cloud-elements/hykes-docs
  repo    https://github.com/cloud-elements/hykes-blueprinter
```

> __PROTIPS:__
* All commands prompt for required arguments which were not provided via options or arguments. This
allows for both traditional usage and also prompt-based usage.
* All arguments can be provided as options (e.g. `[--password|-p <password>]`, `[--path|-P <path>]`,
`[--role|-r <role>]`, `[--url|-U <url>]`).

## Examples and Recipes

### Work against existing local blueprint repo:

It is assumed, in this example, that the local blueprint repo is decrypted.

```bash
$ hykes-blueprinter init \
    /path/to/existing/blueprint/directory
```

### Work against public GitHub blueprint repo:

The local blueprint directory will have the contents of the public GitHub blueprint repo cloned
into it. It is assumed, in this example, that the GitHub blueprint repo is decrypted.

```bash
# Initialize:
$ hykes-blueprinter init \
    /path/to/empty/blueprint/directory \
    git@github.com:cloud-elements/example.com.git

# Change directory to local blueprint:
$ cd /path/to/empty/blueprint/directory

# Modify local blueprint:
...

# Commit and push local blueprint to GitHub blueprint repo:
$ git add -A
$ git commit -m 'Message'
$ git push origin master
```

> __PROTIP:__ All authentication against remotes is handled via `git` itself. Ensure you have set up
`git` so that `git clone` against the URL being provided to `hykes-blueprinter init` is successful.

### Work against private GitHub blueprint repo:

The local blueprint directory will have the contents of the private GitHub blueprint repo cloned
into it. It is assumed, in this example, that the GitHub blueprint repo is encrypted.

```bash
# Initialize:
$ hykes-blueprinter init \
    /path/to/empty/blueprint/directory \
    git@github.com:cloud-elements/dev.ops.cloud-elements.com.git

# Decrypt local blueprint:
$ hykes-blueprinter decrypt

# Change directory to local blueprint:
$ cd /path/to/empty/blueprint/directory

# Modify local blueprint:
...

# Encrypt local blueprint:
$ hykes-blueprinter encrypt

# Commit and push local blueprint to GitHub blueprint repo:
$ git add -A
$ git commit -m 'Message'
$ git push origin master
```

> __PROTIP:__ All authentication against remotes is handled via `git` itself. Ensure you have set up
`git` so that `git clone` against the URL being provided to `hykes-blueprinter init` is successful.

## Changelog

See [CHANGELOG.md](CHANGELOG.md)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## License

See [LICENSE.md](LICENSE.md)
