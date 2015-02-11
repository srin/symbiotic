Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    collection do
      get :recent
      get :popular
      get :unanswered
    end
    resources :comments do
        member do
      put "like", to: "comments#upvote"
      put "dislike", to: "comments#downvote"
    end
  end
end 

  root 'posts#index'
 end
