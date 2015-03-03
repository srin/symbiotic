class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user, :counter_cache => true
	belongs_to :category, :counter_cache => true

	scope :recent, 		->{ order("created_at DESC")}
	scope :popular, 	-> { order("comments_count DESC")}
	scope :unanswered, 	-> {where(comments_count: 0)}
	scope :category, -> category_id {where(:category_id => category_id)}

	scope :category_and_recent, -> {category.order("created_at DESC")}

	validates :title, :description, :category_id, presence: true
	validates :terms, inclusion: { in: [true], message: "and conditions must be accepted" }

	def increase_tally(count=1)
    	update_attribute(:tally, tally + count)
  	end	
end
