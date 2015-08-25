Rails.application.routes.draw do
  devise_for :users

  root 'chat#dashboard'

  post 'messages', to: 'messages#create'
  post 'messages/like/:id', to: 'messages#like'
  post 'messages/unlike/:id', to: 'messages#unlike'
  get 'users/profile/:email', to: 'users#profile', as: :profile
  post 'users/block/:id', to: 'users#block_user', as: :block_user
  post 'users/unblock/:id', to: 'users#unblock_user', as: :unblock_user
  post 'users/avatar', to: 'users#change_avatar', as: :change_avatar
  get '/uploads/user/avatar/:id/:filename' => 'gridfs#avatar'
  get '/users/top_users', to: 'users#top_users', as: :top_users
  get '/messages/get_old_messages', to: 'chat#get_old_messages'
end
