## Branching Model

This project works off of a continuous release approach and uses the
[GitHub Flow](https://guides.github.com/introduction/flow/) branching workflow model.

## Versioning Model

While this project works off a continuous release approach,
[Semantic Versioning](http://semver.org/) is used as a decorator to break up new features, bug
fixes, and documentation into digestible chunks for third-parties.

## Project Management

This project uses GitHub enhanced with [ZenHub](https://www.zenhub.io/) for project management.

## Contributor Norms

### Test Coverage

Outward facing changes _must_ be tested via unit and/or integration tests. Internal changes should
make a best effort to unit and/or integration test.

### Testing

Before creating/submitting a new pull request, you _must_ run `make test` and ensure all tests pass
on your own environment. Ideally, this should be done per commit.

### Rebasing

Before creating/submitting a new pull request, you _must_ rebase against master. This helps keep the
git history free of noisy merge commits.

## Maintainer Norms

### Triggering Parameterized Builds

Before accepting pull requests, you _must_ trigger a CircleCI parameterized build with all `TEST_`
parameters set to `0` (e.g. `TEST_INTEGRATION=0`) to ensure all tests pass on a CI environment
before merging. The [circleci-cli](https://github.com/rockymadden/circleci-cli) project facilitates
this usage pattern (but use whatever works best for you).

### Updating the Version

Updating the version should be done as its own branch/pull request. Updating the changelog should be
part of this.

### Updating the Changelog

Before cutting a new version, you _must_ update the changelog to highlight changes for upstream
developers. It is recommended that larger changes have an accompanying demo.

### Updating Homebrew and PPA

After cutting a new version, you _must_ update the Homebrew formula(s) and PPA(s) for upstream
developers.

## Maintainers

Direct any questions or comments to the project maintainers:

| Name             | GitHub Username
| ---------------- | ---------------
| Rocky Madden     | [rockymadden](https://github.com/rockymadden)
| Travis McChesney | [travismcchesney](https://github.com/travismcchesney)
