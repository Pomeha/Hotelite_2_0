Rails.application.routes.draw do
  devise_for :admin
  namespace :admin do
    resources :hotels do
      member do
        put :approve_hotel
        put :reject_hotel
      end
    end
    resources :users
  end

  devise_for :users
  scope "/admin" do
    resources :users
  end
  #devise_for :users
  resources :hotels do
    resources :reviews
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
