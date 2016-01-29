## Branching Model

This project works off of a continuous release approach and uses the
[GitHub Flow](https://guides.github.com/introduction/flow/) branching workflow model.

## Versioning Model

While this project works off a continuous release approach,
[Semantic Versioning](http://semver.org/) is used as a decorator to break up new features, bug
fixes, and documentation into digestible chunks for third-parties.

## Pull Requests

### Testing

Outward facing changes _must_ be tested via unit and/or integration tests. Internal changes should
make a best effort to unit and/or integration test.

### Rebasing

Before creating/submitting a new pull request, you should rebase against master. This helps keep the
git history free of noisy merge commits.
