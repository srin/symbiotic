class Comment < ActiveRecord::Base
	acts_as_votable
	belongs_to :post, :counter_cache => true
	belongs_to :user, :counter_cache => true

	
end
