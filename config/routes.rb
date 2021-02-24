Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#new'
  resources :users, only: %i[new create show destroy login]
  
  # get '/login' => 'users#new'
  post '/login' => 'users#login'
  # delete '/logout' => 'users#destroy'
  # get '/app/' => 'groups#index'
  # get '/tasks/general' => 'tasks#general'
  # get '/tasks/done' => 'tasks#done'
  # patch '/tasks/:id/toggle' => 'tasks#toggle'
end
