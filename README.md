# Django Workflow Project

This project uses devbox for development environment management and includes several utility scripts for Docker, ArgoCD, and Okteto operations.

## Prerequisites

- [Devbox](https://www.jetpack.io/devbox) installed
- Docker installed and configured for buildx
- Access to a Kubernetes cluster with ArgoCD installed
- Okteto account/access (for development)

## Available Commands

### Development
- `devbox run app` - Run Django development server using uv package manager

### Docker Operations
- `devbox run docker-multi` - Configure Docker for multi-architecture builds
- `devbox run docker-build` - Build and push multi-arch Docker image (arm64/amd64) to GHCR
- `devbox run docker-push` - Push Docker image to GHCR
- `devbox run docker-up` - Run Django application locally in Docker

### ArgoCD Deployment
- `devbox run argocd-create` - Create and sync ArgoCD application
- `devbox run argocd-delete` - Delete ArgoCD application

### Okteto Development
- `devbox run okteto-up` - Start Okteto development environment
- `devbox run okteto-down` - Stop Okteto development environment

### Testing
- `devbox run test` - Run tests (currently returns error as no tests are specified)

## Development Environment

The project uses the following tools:
- `uv` - Python package manager
- `okteto` - Cloud development environments
- `argocd` - GitOps continuous delivery

## Docker Image

The Docker image is built for multiple architectures and pushed to:
`ghcr.io/jdmacd/django-workflow/dev:latest`

## Getting Started

1. Install devbox
2. Clone the repository
3. Run `devbox shell` to enter the development environment
4. Use the commands above as needed for your workflow
