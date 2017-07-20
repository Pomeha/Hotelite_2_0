Rails.application.routes.draw do


  namespace :admin do
    resources :users
    resources :hotels
    resources :reviews

    root to: "users#index"
  end

devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  #devise_for :users
  resources :hotels do
    resources :reviews
    put :approve
    put :reject
    collection do
      get :top
    end
  end
  # resources :hotels
  # namespace :api do
  #   namespace :v1 do
  #     resources :hotels
  #     end
  # end
  root to: "hotels#top"

end
