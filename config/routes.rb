Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :questions do
    member do
      post :like
      post :dislike
      post :follow_question
      post :unfollow
    end
    resources :answers
  end

  resources :users do
    member do
      post :follow_user
    end
  end

  root "questions#index"

end
