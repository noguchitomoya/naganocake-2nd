Rails.application.routes.draw do
  

  scope module: :admin do
    devise_for :admin, controllers: {
      sessions: 'admin/sessions',
      registrations: 'admin/registrations',
      passwords: 'admin/passwords'
    }
  end

  namespace :admin do
    get "/" => "homes#top"
    resources :end_users,only: [:index,:show,:edit,:update]
    resources :genres,only: [:index,:create,:edit,:update]
    resources :items,only: [:index,:new,:create,:edit,:update,:show]
    
  end

      devise_for :end_users,
    skip: :all,
    :controllers => {
      :sessions => 'publics/sessions',
      :registrations => 'publics/registrations'
    }
    devise_scope :end_user do
      get 'end_users/sign_in' => 'public/sessions#new', as: :new_end_user_session
      post 'end_users/sign_in' => 'public/sessions#create', as: :end_user_session
      delete 'end_users/sign_out' => 'public/sessions#destroy', as: :destroy_end_user_session
      get 'end_users/sign_up' => 'public/registrations#new', as: :new_end_user_registration
      post 'end_users/sign_up' => 'public/registrations#create', as: :end_user_registration
    end

  scope module: :public do
    # public/homes
    root "homes#top"
    get "/about" => "homes#about"

    # public  devise
    # devise_for :end_users, controllers: {
    #   sessions: 'public/sessions',
    #   registrations: 'public/registrations',
    #   passwords: 'public/passwords'
    # }

    # public/end_users
    get "/end_users/my_page" => "end_users#show"
    get "/end_users/edit" => "end_users#edit"
    patch "/end_users" => "end_users#update"
    get "end_users/unsubscribe" => "end_users#unsubscribe"
    patch "/end_users/withdraw" => "end_users#withdraw"

    # public/items
    resources :items,only: [:index,:show]
    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
