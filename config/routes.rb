Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations"}

  root to: 'home#home'

  resources :users
  resources :posts
  resources :closed_posts
  resources :conversations, only: [:index, :show, :destroy, :new, :create] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end
  post 'conversations/create' => 'conversations#create' #ask aaron if there's a cleaner way to do this...
  resources :comments
  resources :favorite_post
  resources :venmo
  
  resources :reviews, only: [:new, :create]

  get '/about' => 'home#about'

  get '/send_message' => 'home#send_message'

  get '/inbox' => 'home#inbox'
  
  get 'post_new' => 'posts#new'
  
  get 'posts' => 'posts#index'
  
  get 'post' => 'posts#show'
    
  delete 'post' => 'posts#destroy'

  get 'restore_post' => 'closed_posts#restore'

  # this is a get request that calls post controller with action fav_index to include in favorites route. 

  get 'favorites' => 'posts#fav_index'

  # this is a put request that calls post controller with action favorite to include in 
  # favorite route, posts#favorite adds it to favorites list 

  put 'favorite' => 'posts#favorite'

  get 'venmo_authorize' => 'venmo#callback'

  get 'venmo_initialize_payment' => 'venmo#initialize_payment'

  get 'venmo_final_payment' => 'venmo#final_payment'

  get 'users/new'
  get 'home/login'
  get 'home/signup'


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
