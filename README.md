# hykes-blueprinter <sub><sup>| Hykes blueprint helper</sup></sub>
[![version](http://img.shields.io/badge/version-v0.0.0-blue.svg)](CHANGELOG.md)
[![versioning](http://img.shields.io/badge/versioning-semver-blue.svg)](http://semver.org/)
[![branching](http://img.shields.io/badge/branching-github%20flow-blue.svg)](https://guides.github.com/introduction/flow/)
[![license](http://img.shields.io/badge/license-apache-blue.svg)](LICENSE.md)
[![slack](http://img.shields.io/badge/slack-join-blue.svg)](https://ce-success.herokuapp.com)
[![docs](http://img.shields.io/badge/docs-read-blue.svg)](https://ce-onprem.readthedocs.org)
[![circleci](https://circleci.com/gh/cloud-elements/hykes-blueprinter.svg?style=shield&circle-token=6190bf233e8b1bb1e36f654ce4d765ef249d020f)](https://circleci.com/gh/cloud-elements/hykes-blueprinter)

## Installation

### Via `brew`:

```bash
$ brew tap cloud-elements/hykes git@github.com:cloud-elements/homebrew-hykes.git
$ brew install hykes-blueprinter
```

### Via `git clone`:

```bash
$ git clone git@github.com:cloud-elements/hykes-blueprinter.git
$ cd hykes-blueprinter
$ git checkout tags/v0.0.0
$ make dependencies && make install
```

> __PROTIPS:__
* `git clone` installation method does not place `hykes-blueprinter` on your `PATH`, so you must
reference it relatively (e.g. `build/bin/hykes-blueprinter`).
* `make dependencies` on Linux requires `sudo`.

## Usage

```bash
$ hykes-blueprinter --help
Usage:
  hykes-blueprinter decrypt <password>
  hykes-blueprinter decrypted
  hykes-blueprinter encrypt <password>
  hykes-blueprinter encrypted
  hykes-blueprinter init <path> [url]
  hykes-blueprinter list-servers [role]

Install Commands:
  init    Initialize to work against the given blueprint

Cryptography Commands:
  decrypt      Decrypt blueprint
  decrypted    Output boolean indicating if decrypted
  encrypt      Encrypt blueprint
  encrypted    Output boolean indicating if encrypted

Discovery Commands:
  list-servers     Output unfurled servers from blueprint inventory

More Information:
  chat    https://ce-success.herokuapp.com
  docs    https://ce-onprem.readthedocs.org
  repo    https://github.com/cloud-elements/hykes-blueprinter
```

> __PROTIP:__ All commands prompt for required arguments which were not provided via options or
arguments. This allows for both traditional usage and also prompt-based usage.

## Changelog

See [CHANGELOG.md](CHANGELOG.md)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## License

See [LICENSE.md](LICENSE.md)
