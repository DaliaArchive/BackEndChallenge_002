Rails.application.routes.draw do
  get "/" => redirect("/new")

  get 'new' => "games#new"
  post '/'  => "games#create"
  get ':id' => "games#show"
end
