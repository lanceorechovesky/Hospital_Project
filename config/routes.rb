Rails.application.routes.draw do
  devise_for :users
  root 'home#title'
  get '/search_hospitals' => 'hospitals#search_hospitals'
  
  resources :hospitals do

    member do
      post :create_doctor
      delete :destroy_doctor      
    end

    resources :patients do
      member do        
        post :create_doctor
        delete :destroy_doctor
        put :waiting_room
        put :with_dr
        put :admitted
        put :test
        put :surgery
        put :prep_dis
        put :pay_bill
      end

      collection do 
        get '/search_hospital_patients' => 'patients#search_hospital_patients'
      end

      resources :medications do
        collection do 
          get '/search_patient_medications' => 'medications#search_patient_medications'
        end
      end

    end
  end
end
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
  #   resources :patients do
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

