Rails.application.routes.draw do
  
  get 'categories/corporate'

  get 'categories/ip'

  get 'categories/employment'

  get 'categories/real_estate'

  get 'categories/venture_cap'

  get 'profiles/myprofile' do
    collection do
      get :recent
      get :popular
    end
  end

  get 'profiles/lawyerprofile' do
    collection do
      get :recent
      get :popular
    end
  end

  devise_for :users
  resources :posts do
    collection do
      get :recent
      get :popular
      get :unanswered
      get :category_and_recent
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
