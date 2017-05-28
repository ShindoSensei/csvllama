Rails.application.routes.draw do
  root 'main#index'
  post 'main', to:'main#import_csv', as: 'import_csv'
  post 'main/search', to:'main#search_state', as: 'search_state'
end
