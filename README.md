# my-ts-package

A robust TypeScript package with a fully automated CI/CD pipeline.

## Features

- **TypeScript Native**: Full type support out of the box.
- **Automated CI/CD**: Label-driven workflows for testing and publishing.
- **Strict Versioning**: Enforced semantic versioning with release candidates.
- **Secure**: Automated branch protection and linear history enforcement.

## Installation

```bash
npm install my-ts-package
```

## Development

### Available Scripts

- `npm run build`: Compiles the TypeScript code to `dist/`.
- `npm test`: Runs unit tests using Vitest.
- `npm run test:integration`: Runs integration/E2E tests.
- `npm run lint`: Checks for code style issues.

## CI/CD Workflow

This project uses a reusable workflow from the `devops-actions` repository.

### Pull Request Verification
Every PR must pass the following checks:
- **Linting & Build**: Code must compile and follow style guides.
- **Unit Tests**: All unit tests must pass.
- **Linear History**: Only squash or rebase merges are allowed.
- **Up-to-Date**: PRs must be synchronized with the `main` branch.

### Label-Driven Actions
Apply these labels to your PR to trigger specific behaviors:

- **`verify`**: Triggers the **Integration/E2E test** suite. Required for complex changes.
- **`publish`**: 
  - Verifies if the version in `package.json` is unique.
  - Generates a **Release Candidate** artifact (`X.Y.Z-dev-<sha>`).
  - Blocks merging if the version already exists in the registry.

### Release Process
When a PR with the `publish` label is merged:
1.  The package is automatically published to NPM.
2.  A Git tag (e.g., `v1.2.3`) is created and pushed.
3.  A GitHub Release is automatically generated with release notes.

## Repository Configuration

To set up the required branch protection rules, run the provided script (requires `gh` CLI):

```bash
./.github/branch-protection.sh
```

## API

### `sum(a: number, b: number): number`
Returns the sum of two numbers.

hello