Rails.application.routes.draw do

  root 'index#index'

  devise_for :users, path: "user"
  
  resources :users do

    collection do
      get "/teachers", to: "users#teachers_index"
      
    end

    member do
      get "/student_profile", to: "users#student_profile"
      get "/teacher/show", to: "users#show_teacher"
      
    end

  end

  resources :courses do 
    collection do
      get "/student_index", to: "courses#student_index"
      get "/search", to: "courses#search"
    end
    member do
      get "/search_content/:content_id", to: "contents#search", as: "search_content"
      get "/show_enrolled", to: "courses#show_enrolled"
      post "/enroll", to: "courses#enroll"
      get "/show_to_student", to: "courses#show_to_student"
      get "/content/new", to: "contents#new"
      get "/content/:content_id", to: "contents#show", as: "show_content"
      post "/content/create", to: "contents#create"
      put "/content/update", to: "contents#update"
      get "/content/:content_id/show_to_student", to: "contents#show_to_student", as: "show_content_to_student"
      get "/content/:content_id/material/:material_id", to: "materials#show", as: "material"
      put "/content/:content_id/material/:material_id", to: "materials#update"
    end
  end

  get "/home/redirect", to: "home#redirect"
  get "/index", to: "home#index"
  get "/index/student", to: "home#normal_user_index"
  get "/index/teacher", to: "home#teacher_index"
  get "/index/expert", to: "home#expert_index"
  get "/create_teacher_form", to: "users#create_teacher_form"
  post "/create_teacher", to: "users#create_teacher"
  get "/survey/answer", to: "surveys#answer"
  post "/survey/process_answer", to: "surveys#process_answer"
  # resources :users

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
