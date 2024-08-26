Rails.application.routes.draw do
  resources :product_specification_versions
  resources :product_ftm_certifications
  resources :system_integrators
  resources :si_partnerships
  resources :product_images
  resources :partners
  resources :partner_categories
  resources :enquiries
  resources :biometrics
  resources :mosip_compliance_statuses
  resources :manufacturers
  resources :products
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'homes#index'
  get 'homes/index'

  devise_for :users
  get '/admin/dashboard' => 'admin/dashboard#index'

  # Admin sidebar manus
  namespace :admin do
    resources :product_ftm_certifications
    resources :product_specification_versions
    resources :partner_categories
    resources :partners
    resources :products do
      collection do
        get 'download_sample_excel'
        post 'upload_excel'
      end
    end
    resources :manufacturers do
      collection do
        get 'download_sample_excel'
        post 'upload_excel'
      end
    end

    resources :categories
    get '/admin/dashboard' => 'admin/dashboard#index'
  end
end
