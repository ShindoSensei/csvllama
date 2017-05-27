Rails.application.routes.draw do
  get 'main/index'
  post 'main', to:'main#import', as: 'import_csv'

  # post 'shortlists', to:'shortlists#create'
  # post '/properties/:id', to: 'properties#contact_owner', as: 'contact_owner'

  # resources :main do
  #   collection { post :import }
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
