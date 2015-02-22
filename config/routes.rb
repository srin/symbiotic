Rails.application.routes.draw do
  
  get 'static_pages/about'

  get 'static_pages/faq'

  get 'static_pages/contact'

  get 'static_pages/how_it_works'

  get 'static_pages/privacy'

  get 'static_pages/terms'

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
