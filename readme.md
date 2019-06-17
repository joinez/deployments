# Deployments

Keep track of all deployments across all your environments

## Getting Started

These instructions will get you a copy of the project up and running on your
local machine for development and testing purposes.

### Prerequisites

- Docker & Docker Compose
- Ruby (use current [version](backend/.ruby-version))

### Setup

Get your development environment up and running with following steps

```sh
# Info: this step can be repeated to update you enviroment as well
./script/setup.sh
```

Start the server
```sh
cd backend
rails s
```

## Accessing data

When the server is running, open the [graphiql ui](http://localhost:3000/graphiql) in your browser. Copy paste any of the following queries to fetch the data.

For deployments:

```sh
# All deployments
{
  deployments {
    id
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

## Testing

The backend uses rspec for its unit tests. Run them with

```sh
rspec
```

Or if you️ ❤️  TDD

```sh
bundle exec guard -c
```
