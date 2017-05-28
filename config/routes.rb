Rails.application.routes.draw do
  post 'main', to:'main#import', as: 'import_csv'
  root 'main#index'
  
end
