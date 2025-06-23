Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :projects do
    resources :sub_projects do
      resources :structure_drawings do
        member do
          get "get_attachments"
        end
      end
      resources :hydralic_particulars
      resources :bench_marks
      resources :coordinates do
        collection do
          post "import"
        end
      end
      resources :village_maps
      resources :site_maps
      resources :custom_menus
      resources :attachments
    end
  end
  devise_for :users
  resources :manage_users
  resources :attachments
  resources :photos
  root 'projects#index'
  get '/tgp', :to => redirect('/tgp.html')

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
