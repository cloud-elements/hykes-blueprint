# hykes-blueprint <sub><sup>| Cloud Elements Enterprise blueprint utility</sup></sub>
[![version](http://img.shields.io/badge/version-0.2.0-blue.svg)](CHANGELOG.md)
[![spec](http://img.shields.io/badge/spec-%3E%3D%200.0.0-blue.svg)](https://github.com/cloud-elements/hykes-spec)
[![versioning](http://img.shields.io/badge/versioning-semver-blue.svg)](CONTRIBUTING.md)
[![branching](http://img.shields.io/badge/branching-github%20flow-blue.svg)](CONTRIBUTING.md)
[![pm](http://img.shields.io/badge/pm-zenhub-blue.svg)](CONTRIBUTING.md)
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
  hykes-blueprint decrypt <password> [--quiet]
  hykes-blueprint decrypted [--quiet]
  hykes-blueprint encrypt <password> [--quiet]
  hykes-blueprint encrypted [--quiet]
  hykes-blueprint ls [role] [--quiet]

Cryptography Commands:
  decrypt      Decrypt blueprint
  decrypted    Output boolean indicating if decrypted
  encrypt      Encrypt blueprint
  encrypted    Output boolean indicating if encrypted

Query Commands:
  ls    Output unfurled servers from blueprint inventory

More Information:
  docs     https://developers.cloud-elements.com
  forum    https://forum.cloud-elements.com
  repo     https://github.com/cloud-elements/hykes-blueprint
```

> __PROTIPS:__
* All commands prompt for required arguments which were not provided via options or arguments. This
allows for both traditional usage and also prompt-based usage.
* All arguments can be provided as options (e.g. `[--password=<password>]`, `[--role=<role>]`).

## Changelog

See [CHANGELOG.md](CHANGELOG.md)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## License

See [LICENSE.md](LICENSE.md)
