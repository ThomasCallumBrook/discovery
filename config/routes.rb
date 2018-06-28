Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index] do
    resources :countries, except: [:new, :edit] do
      resources :blogs
    end
  end


  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
