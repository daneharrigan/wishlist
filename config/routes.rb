XmasList::Application.routes.draw do
  devise_for :user, skip: [:sessions, :passwords, :registration, :confirmations]
  devise_scope :user do
    get    "sign-in",  to: "devise/sessions#new",     as: :new_user_session
    post   "sign-in",  to: "devise/sessions#create",  as: :user_session
    get    "sign-out", to: "devise/sessions#destroy", as: :destroy_user_session

    post "users/password",      to: "devise/passwords#create",     as: :user_password
    get  "users/password/new",  to: "devise/passwords#new",        as: :new_user_password
    get  "users/password/edit", to: "devise/passwords#edit",       as: :edit_user_password
    put  "users/password",      to: "devise/passwords#update",     as: :user_password
    get  "register/cancel",     to: "devise/registrations#cancel", as: :cancel_user_registration
    post "register",            to: "devise/registrations#create", as: :user_registration
    get  "sign-up",             to: "devise/registrations#new",    as: :new_user_registration
  end

  root to: "items#index"

  resources :users, only: [] do
    resources :items, only: [:index, :create, :destroy, :update]
  end
end
