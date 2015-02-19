class Category < ActiveRecord::Base
	has_many :posts

	scope :recentc, 		->{ Post.order("created_at DESC")}
	scope :popularc, 	-> { Post.order("comments_count DESC")}
	scope :unansweredc, 	-> { Post.where(comments_count: 0)}
end
