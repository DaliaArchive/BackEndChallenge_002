Rails.application.routes.draw do
  get "/" => redirect("/new")

  namespace :api do
    get ':id' => "games#show"
    post '/'  => "games#create"
  end

  get 'new' => "games#new"
  get ':id' => "games#show"
end
