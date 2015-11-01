Rails.application.routes.draw do
  root 'home#home'
  

  resources :users
  resources :posts

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'

<<<<<<< HEAD
  get 'posts' => 'posts#new'

  get 'posts/all' => 'posts#index'
  post 'posts/:id' => 'posts#update'
  post 'posts' => 'posts#create'
  delete 'posts' => 'posts#delete'
=======
  get 'posts' => 'posts#show'
  post 'posts/:id' => 'posts#update'
  get 'post_new' => 'posts#new'
  post 'post' => 'posts#create'
  delete 'posts' => 'posts#destroy'
>>>>>>> a7ed8b7f13409944f692d9c2adeb5f804acd05e6

  get 'users/new'

  


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
