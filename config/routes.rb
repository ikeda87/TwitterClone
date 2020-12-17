Rails.application.routes.draw do
  root 'toukous#index'
  resources :toukous do
    collection do
        post :confirm
    end
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
