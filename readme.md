# Deployments [![CircleCI](https://circleci.com/gh/joinez/deployments.svg?style=svg)](https://circleci.com/gh/joinez/deployments)

Keep track of all deployments across all your environments

## Getting Started

These instructions will get you a copy of the project up and running on your
local machine for development and testing purposes.

### Prerequisites

- Docker & Docker Compose
- Ruby (use current [version](backend/.ruby-version))
- Node (use current [stable release](https://nodejs.org/en/about/releases/))

### Setup

Get your development environment up and running with following steps

#### Setup with docker
```sh
./script/build.sh
docker-compose up -d
```
#### Or setup locally
```sh
# Info: this step can be repeated to update you enviroment as well
./script/setup.sh
```
Start the server
```sh
cd backend
rails s
```
Start the vue frontend
```sh
cd frontend
npm run serve
```
The app is then available at http://localhost:8080 🎉

## Accessing data

When the server is running, open the [graphiql ui](http://localhost:3000/graphiql) in your browser. Copy paste any of the following queries to fetch the data.

For deployments:

```sh
# All deployments
{
  deployments {
    id
    buildId
    startedAt
    finishedAt
    service {
      id
      name
    }
  }
}

# Single deployment
{
  deployment(id: 1) {
    buildId
    startedAt
    finishedAt
  }
}
```

For services:

```sh
# All services
{
  services {
    id
    name
  }
}

# Single service
{
  service(id: 2) {
    name
  }
}
```

## Creating data

Use this mutation for creating new deployment entries:

```sh
# Start
mutation {
  startDeployment(
    input: { service: "Application 2", buildId: "1" }
  ) {
    deployment {
      id
      buildId
      startedAt
      finishedAt
    }
  }
}

# Finish
mutation {
  finishDeployment(
    input: { service: "Application 2", buildId: "1" }
  ) {
    deployment {
      id
      buildId
      startedAt
      finishedAt
    }
  }
}

# Or use curl to start or finish a deployment:
curl -i -H 'Content-Type: application/json' -X POST -d '{"query": "mutation { startDeployment(input: { service: \"Application 3\", buildId: \"1\" }) { deployment { id } } }"}' localhost:3000/graphql
curl -i -H 'Content-Type: application/json' -X POST -d '{"query": "mutation { finishDeployment(input: { service: \"Application 3\", buildId: \"1\" }) { deployment { id } } }"}' localhost:3000/graphql
```

## Testing

The backend uses rspec for its unit tests. Run them with

```sh
rspec
```

Or if you️ ❤️  TDD

```sh
bundle exec guard -c
```
