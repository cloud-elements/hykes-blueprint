# hykes-blueprinter <sub><sup>| Cloud Elements cloud blueprint utility</sup></sub>
[![version](http://img.shields.io/badge/version-v0.0.0-blue.svg)](CHANGELOG.md)
[![versioning](http://img.shields.io/badge/versioning-semver-blue.svg)](http://semver.org/)
[![branching](http://img.shields.io/badge/branching-github%20flow-blue.svg)](https://guides.github.com/introduction/flow/)
[![license](http://img.shields.io/badge/license-apache-blue.svg)](LICENSE.md)
[![slack](http://img.shields.io/badge/slack-join-blue.svg)](https://ce-success.herokuapp.com)
[![docs](http://img.shields.io/badge/docs-read-blue.svg)](https://ce-onprem.readthedocs.org)
[![circleci](https://circleci.com/gh/cloud-elements/hykes-blueprinter.svg?style=shield)](https://circleci.com/gh/cloud-elements/hykes-blueprinter)

## Grokking
![diagram](http://share.rockymadden.com/1I1A142Y1F3V/Image%202016-01-26%20at%201.06.49%20PM.png)

## Installation

### Via Homebrew:

```bash
$ brew tap cloud-elements/hykes
$ brew install hykes-blueprinter
$ hykes-blueprinter init
```

### Via PPA:

In development

### Compiling from Source:

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
  docs    https://ce-onprem.readthedocs.org
  repo    https://github.com/cloud-elements/hykes-blueprinter
```

> __PROTIPS:__
* All commands prompt for required arguments which were not provided via options or arguments. This
allows for both traditional usage and also prompt-based usage.
* All arguments can be provided as options (e.g. `[--password|-p <password>]`, `[--path|-P <path>]`,
`[--role|-r <role>]`, `[--url|-U <url>]`).

## Examples and Recipes

### Init against existing local blueprint repo

```bash
$ hykes-blueprinter init ~/path/to/existing/blueprint/directory
```

### Init against public GitHub blueprint repo

The local blueprint directory will have the contents of the public GitHub blueprint repo cloned
into it.

```bash
$ hykes-blueprinter init ~/path/to/empty/blueprint/directory git@github.com:cloud-elements/example.com.git
```

### Init against private GitHub blueprint repo and decrypt

The local blueprint directory will have the contents of the private GitHub blueprint repo cloned
into it.

```bash
$ hykes-blueprinter init ~/path/to/empty/blueprint/directory git@github.com:cloud-elements/dev.ops.cloud-elements.com.git
$ hykes-blueprinter decrypt
```

> __PROTIP:__ All authentication against remotes is handled via `git` itself. Ensure you have set up
`git` so that `git clone` against the URL being provided to `hykes-blueprinter init` is successful.

## Changelog

See [CHANGELOG.md](CHANGELOG.md)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## License

See [LICENSE.md](LICENSE.md)
