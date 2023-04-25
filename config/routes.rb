Rails.application.routes.draw do
  root :to => 'homes#top'
  get 'homes/top'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    post 'users/sign_up/confirm',  to: 'users/registrations#confirm'
    get  'users/sign_up/complete', to: 'users/registrations#complete'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products do
    collection do
      post :confirm
    end
  end
  resources :clients do
    collection do
      get  :complete
      post :confirm
    end
  end
  resources :ufo_catchers do
    collection do
      post :confirm
    end
  end
end
