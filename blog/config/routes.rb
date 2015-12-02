Rails.application.routes.draw do

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  resources :notifications
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'createprofile', to: 'profiles#new', as: 'createprofile'
  get 'yellowpages', to: 'yellowpages#index', as: 'yellowpages'
  get 'newyellowpage', to: 'yellowpages#new', as: 'newyellowpage'


  get 'newBlog', to: 'posts#newBlog', as: 'newBlog' #"/newBlog" creates a new blog
  get 'newForum', to: 'posts#newForum', as: 'newForum' #"/newforum" creates a new forum
  get 'newAnnouncement', to: 'posts#newAnnouncement', as: 'newAnnouncement' #"/newAnnouncemet" creates a new Announcemet
  get 'newComplain', to: 'posts#newComplain', as: 'newComplain' #"/newforum" creates a new Complain

  get 'blogs', to: 'posts#blogs', as: 'blogs' #"/blogs" displays all blogs
  get 'forums', to: 'posts#forums', as: 'forums' #"/forums" displays all forums
  get 'announcements', to: 'posts#announcements', as: 'announcements' #"/announcements" displays all announcements
  get 'complains', to: 'posts#complains', as: 'complains' #"/forums" displays all Complains
  get "verify/:profile_id" => 'profiles#verify', :as => 'verify'

  get 'people', to: 'profiles#index', as: 'people'
  get "posts/new/:data_type" => "posts#new", :as => :new_post_with_parameter
  get 'tags/:tag', to: 'posts#blogs',as: :tag
  get 'admin', to:  "reports#index", as: 'admin'
  #get 'newyp', to: 'yellowpages#create', as: 'newYellowPage'

  resources :users
  resources :polls
  resources :ratings
  resources :tags
  resources :yellowpages
  resources :posts do
    resources :comments, :only => [:create]
    resources :reports, :only => [:create]
  end
  resources :profiles
  resources :communities
  resources :roles
  resources :sessions
  resources :attempts
  resources :surveys
  resources :reports
  get 'surveys/show'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'posts#index'

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
