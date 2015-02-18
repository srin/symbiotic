class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user, :counter_cache => true
	belongs_to :category, :counter_cache => true

	scope :recent, 		->{ order("created_at DESC")}
	scope :popular, 	-> { order("comments_count DESC")}
	scope :unanswered, 	-> {where(comments_count: 0)}
	scope :category, -> category_id {where(:category_id => category_id)}

	def increase_tally(count=1)
    	update_attribute(:tally, tally + count)
  	end	
end
