set -e

DOCKER_BUILDKIT=1 docker build -t deployments-backend --target dev backend
DOCKER_BUILDKIT=1 docker build -t deployments-frontend --target dev frontend
