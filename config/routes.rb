Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
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

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
