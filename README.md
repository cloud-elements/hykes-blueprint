# hykes-blueprint <sub><sup>| Cloud Elements cloud blueprint utility</sup></sub>
[![version](http://img.shields.io/badge/version-v0.0.2-blue.svg)](CHANGELOG.md)
[![versioning](http://img.shields.io/badge/versioning-semver-blue.svg)](http://semver.org)
[![branching](http://img.shields.io/badge/branching-github%20flow-blue.svg)](https://guides.github.com/introduction/flow/)
[![license](http://img.shields.io/badge/license-apache-blue.svg)](LICENSE.md)
[![pm](http://img.shields.io/badge/pm-zenhub-blue.svg)](https://www.zenhub.io)
[![docs](http://img.shields.io/badge/docs-read-blue.svg)](http://dev.cloud-elements.com)
[![forum](http://img.shields.io/badge/forum-join-blue.svg)](http://forum.cloud-elements.com)
[![circleci](https://circleci.com/gh/cloud-elements/hykes-blueprint.svg?style=shield)](https://circleci.com/gh/cloud-elements/hykes-blueprint)

## Installation

### Via Homebrew:

```bash
# Install via tap:
$ brew tap cloud-elements/hykes
$ brew install hykes-blueprint

# Initialize:
$ hykes-blueprint init
```

### Via PPA:

In development

### Via compiling from source:

```bash
$ git clone git@github.com:cloud-elements/hykes-blueprint.git
$ cd hykes-blueprint
$ make
$ make install
$ build/bin/hykes-blueprint init
```

> __PROTIP:__
You are responsible for ensuring all dependencies are installed, including transitive dependencies.
Examine [circle.yml](circle.yml) for a detailed example of the steps needed to compile from source
on Ubuntu.

## Usage

```bash
$ hykes-blueprint --help
Usage:
  hykes-blueprint decrypt <password> [--quiet|-q]
  hykes-blueprint decrypted [--quiet|-q]
  hykes-blueprint encrypt <password> [--quiet|-q]
  hykes-blueprint encrypted [--quiet|-q]
  hykes-blueprint init <path> [url] [--quiet|-q]
  hykes-blueprint list-servers [role] [--quiet|-q]

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
  docs     http://dev.cloud-elements.com
  forum    http://forum.cloud-elements.com
  repo     https://github.com/cloud-elements/hykes-blueprint
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
$ hykes-blueprint init /path/to/existing/blueprint/directory
```

### Work against public GitHub blueprint repo:

The local blueprint directory will have the contents of the public GitHub blueprint repo cloned
into it. It is assumed, in this example, that the GitHub blueprint repo is decrypted.

```bash
# Initialize:
$ hykes-blueprint init \
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
`git` so that `git clone` against the URL being provided to `hykes-blueprint init` is successful.

### Work against private GitHub blueprint repo:

The local blueprint directory will have the contents of the private GitHub blueprint repo cloned
into it. It is assumed, in this example, that the GitHub blueprint repo is encrypted.

```bash
# Initialize:
$ hykes-blueprint init \
    /path/to/empty/blueprint/directory \
    git@github.com:cloud-elements/dev.ops.cloud-elements.com.git

# Decrypt local blueprint:
$ hykes-blueprint decrypt

# Change directory to local blueprint:
$ cd /path/to/empty/blueprint/directory

# Modify local blueprint:
...

# Encrypt local blueprint:
$ hykes-blueprint encrypt

# Commit and push local blueprint to GitHub blueprint repo:
$ git add -A
$ git commit -m 'Message'
$ git push origin master
```

> __PROTIP:__ All authentication against remotes is handled via `git` itself. Ensure you have set up
`git` so that `git clone` against the URL being provided to `hykes-blueprint init` is successful.

## Changelog

See [CHANGELOG.md](CHANGELOG.md)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## License

See [LICENSE.md](LICENSE.md)
