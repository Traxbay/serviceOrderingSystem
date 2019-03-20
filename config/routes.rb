Rails.application.routes.draw do
  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'basic_pages#home'
  get '/about', to:'basic_pages#about'
  get '/contact', to: 'basic_pages#contact'
  get '/signup/', to: 'users#new'

end
