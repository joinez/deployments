import { gql } from 'apollo-boost'

export const getClouds = gql`
  query {
    clouds {
      id
      name
      environments {
        id
        name
      }
    }
  }
`

export const getDeployments = gql`
  query {
    deployments {
      id
      success
      duration
      buildUrl
      environment {
        id
        name
        cloud {
          name
        }
      }
      deploymentVersions {
        version
        service {
          name
        }
      }
    }
  }
`

export const getEnvironment = gql`
  query($id: ID!) {
    environment(id: $id) {
      name
      cloud {
        name
      }
      services {
        id
        name
        currentVersions {
          id
          version
        }
      }
    }
  }
`
