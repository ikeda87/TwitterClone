Rails.application.routes.draw do
  root 'toukous#index'
  resources :toukous do
    collection do
        post :confirm
    end
  end
end
