import { gql } from 'apollo-boost'

export const getEnvironment = gql`
  query($id: ID!) {
    environment(id: $id) {
      name
    }
  }
`
