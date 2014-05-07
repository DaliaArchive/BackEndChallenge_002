Rails.application.routes.draw do
  root :to => "home#index"
  resources :games, except: :delete do
    collection do
      post 'search'
    end
  end
  resources :game_results, only: :show
end
