Rails.application.routes.draw do
  resources :urls

  root to: 'urls#index'

  get '/s/:encode_id', to: 'urls#decode'
end
