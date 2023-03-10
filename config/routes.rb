Rails.application.routes.draw do
  get 'homes/top'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    post 'users/sign_up/confirm',  to: 'users/registrations#confirm'
    get  'users/sign_up/complete', to: 'users/registrations#complete'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
