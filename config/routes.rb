Rails.application.routes.draw do
  namespace :admin do
    resources :hotels
  end
  devise_for :users
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
