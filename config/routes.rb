Rails.application.routes.draw do
  resources :urls
  get ':token'  => 'home#visit_shortened_url', as: :visit_shortened_url
  get ':token/info'  => 'home#shortened_url_info', as: :shortened_url_info
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "urls#index"
end
