Rails.application.routes.draw do
  
  get 'static_pages/about'

  get 'static_pages/faq'

  get 'static_pages/contact'

  get 'static_pages/how_it_works'

  get 'static_pages/privacy'

  get 'static_pages/terms'

  
  get 'posts/corporate'

  get 'posts/ip'

  get 'posts/show_all'

  get 'posts/employment'

  get 'posts/real_estate'

  get 'posts/venture_cap'

  get 'profiles/myprofile' 
    

  get 'profiles/lawyerprofile' 

  match 'corporate' => 'posts#corporate', via: [:get]
  match 'ip' => 'posts#ip', via: [:get]
  match 'employment' => 'posts#employment', via: [:get]
  match 'realestate' => 'posts#real_estate', via: [:get]
  match 'venturecapital' => 'posts#venturecapital', via: [:get]


  match 'search' => 'posts#search', via: [:get, :post], as: :search
  

  devise_for :users
  resources :posts do
    resources :comments do
        member do
      put "like", to: "comments#upvote"
      put "dislike", to: "comments#downvote"
    end
  end
end 

  root 'posts#index'
 end
