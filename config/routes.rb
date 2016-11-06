Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :conversations, only: [:show] do
  end

  namespace :api do
    namespace :v1 do
      resources :conversations, only: [] do
        get :last_messages
      end
      resources :messages, only: [:index, :show, :create]
    end
  end
end
