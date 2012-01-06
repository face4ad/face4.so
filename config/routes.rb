Face4::Application.routes.draw do


  resources :comments

  resources :answers

  devise_for :users, :controllers => { :registrations => "registrations" }

  #resources :users

  #sina login path
  match "syncs/:type/new" => "syncs#new", :as => :sync_new
  match "syncs/:type/callback" => "syncs#callback", :as => :sync_callback
  match "signup" => "users#signup", :as => :user_signup


  authenticate :user do 
    #registration question(quiz)
    #Show random question
    #TODO possibily add to resource :reg_questions
    match "/user/reg" => "reg_questions#random", :via => [:get], :as => :show_random_reg_question

    #Answer the question
    match "/user/reg/answer" => "users#answer_reg_question", :via => [:put, :post], :as => :answer_reg_question

    #User dashboard
    match "/user/dashboard" => "users#dashboard", :as => :dashboard

    #Tagged question
    match "/questions/tag" => "questions#tagged_with", :as => :tagged_questions
  
    #List all tags
    match "/questions/tags" => "questions#tags_list", :as => :tags_list
 
    resources :questions

    #User create question
    #match "/user/question/new" => "users#new_question", :as => :new_question

    #resources :reg_questions

    # The priority is based upon order of creation:
    # first created -> highest priority.

    # Sample of regular route:
    #   match 'products/:id' => 'catalog#view'
    # Keep in mind you can assign values other than :controller and :action

    # Sample of named route:
    #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
    # This route can be invoked with purchase_url(:id => product.id)

    # Sample resource route (maps HTTP verbs to controller actions automatically):
    #   resources :products

    # Sample resource route with options:
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

    # Sample resource route with sub-resources:
    #   resources :products do
    #     resources :comments, :sales
    #     resource :seller
    #   end

    # Sample resource route with more complex sub-resources
    #   resources :products do
    #     resources :comments
    #     resources :sales do
    #       get 'recent', :on => :collection
    #     end
    #   end

    # Sample resource route within a namespace:
    #   namespace :admin do
    #     # Directs /admin/products/* to Admin::ProductsController
    #     # (app/controllers/admin/products_controller.rb)
    #     resources :products
    #   end

    # You can have the root of your site routed with "root"
    # just remember to delete public/index.html.
    root :to => 'users#dashboard'
  end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
