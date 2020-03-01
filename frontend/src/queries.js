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
        name
        cloud {
          name
        }
      }
      currentVersions {
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
