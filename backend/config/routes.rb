Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'

  if Rails.env.development?
    get '/' => redirect('/graphiql')
    mount GraphiQL::Rails::Engine,
          at: '/graphiql',
          graphql_path: 'graphql#execute'
  end
end
