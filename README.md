# hykes-blueprint <sub><sup>| Cloud Elements cloud blueprint utility</sup></sub>
[![version](http://img.shields.io/badge/version-v0.1.0-blue.svg)](CHANGELOG.md)
[![versioning](http://img.shields.io/badge/versioning-semver-blue.svg)](http://semver.org)
[![branching](http://img.shields.io/badge/branching-github%20flow-blue.svg)](https://guides.github.com/introduction/flow/)
[![license](http://img.shields.io/badge/license-apache-blue.svg)](LICENSE.md)
[![pm](http://img.shields.io/badge/pm-zenhub-blue.svg)](https://www.zenhub.io)
[![docs](http://img.shields.io/badge/docs-read-blue.svg)](https://developers.cloud-elements.com)
[![forum](http://img.shields.io/badge/forum-join-blue.svg)](https://forum.cloud-elements.com)
[![circleci](https://circleci.com/gh/cloud-elements/hykes-blueprint.svg?style=shield)](https://circleci.com/gh/cloud-elements/hykes-blueprint)

## Installation

### Via Homebrew:

```bash
$ brew tap cloud-elements/hykes
$ brew install hykes-blueprint
```

### Via PPA:

In development

### Via compiling from source:

```bash
$ git clone git@github.com:cloud-elements/hykes-blueprint.git
$ cd hykes-blueprint
$ make
$ make install
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
  hykes-blueprint ls [role] [--quiet|-q]

Cryptography Commands:
  decrypt      Decrypt blueprint
  decrypted    Output boolean indicating if decrypted
  encrypt      Encrypt blueprint
  encrypted    Output boolean indicating if encrypted

Discovery Commands:
  ls    Output unfurled servers from blueprint inventory

More Information:
  docs     https://developers.cloud-elements.com
  forum    https://forum.cloud-elements.com
  repo     https://github.com/cloud-elements/hykes-blueprint
```

> __PROTIPS:__
* All commands prompt for required arguments which were not provided via options or arguments. This
allows for both traditional usage and also prompt-based usage.
* All arguments can be provided as options (e.g. `[--password|-p <password>]`, `[--role|-r <role>]`
).

## Examples and Recipes

### Work against private blueprint repo, which is remotely hosted on GitHub:

The local blueprint repo will have the contents of the private GitHub blueprint repo cloned into it.
It is assumed, in this example, that both blueprint repos are encrypted.

```bash
# Change directory to local blueprint:
$ cd /path/to/blueprint

# Decrypt local blueprint:
$ hykes-blueprint decrypt

# Modify local blueprint:
...

# Encrypt local blueprint:
$ hykes-blueprint encrypt

# Commit and push local blueprint to GitHub:
$ git add -A
$ git commit -m 'Message'
$ git push origin master
```

### Work against public blueprint repo, which is remotely hosted on GitHub:

The local blueprint repo will have the contents of the public GitHub blueprint repo cloned into it.
It is assumed, in this example, that both blueprint repos are decrypted.

```bash
# Change directory to local blueprint:
$ cd /path/to/blueprint

# Modify local blueprint:
...

# Commit and push local blueprint to GitHub:
$ git add -A
$ git commit -m 'Message'
$ git push origin master
```

## Changelog

See [CHANGELOG.md](CHANGELOG.md)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## License

See [LICENSE.md](LICENSE.md)
