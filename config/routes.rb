Rails.application.routes.draw do
  root to: 'home#index'
  post '/login', to: 'home#login'
  get '/planning_room', to: 'planning_room#index'
  post '/set_points', to: 'planning_room#set_points'
end
