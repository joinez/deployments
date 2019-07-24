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

```sh
# All clouds and environments
{
  clouds {
    id
    name
    environments {
      id
      name
    }
  }
}

# All deployments with services
{
  deployments {
    id
    buildUrl
    success
    duration
    services {
      id
      name
    }
  }
}
```

## Creating data

Use this mutation for creating a new deployment:

```sh
# This is an example of a successful deployment of Auth service 1.3.0 and
# Application1 1.0.2 in AWS/staging, a duration of 60 seconds and the build URL
mutation {
  createDeployment(
    input: {
      cloud: "AWS"
      environment: "staging"
      buildUrl: "example.com/build/4"
      success: true
      duration: 60
      serviceVersions: [
        { service: "Auth service", version: "1.3.0" }
        { service: "Application1", version: "1.0.2" }
      ]
    }
  ) {
    deployment {
      id
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
