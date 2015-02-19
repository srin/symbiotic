class CategoriesController < ApplicationController

  has_scope :recent, :type => :boolean
  has_scope :popular, :type => :boolean
  has_scope :unanswered, :type => :boolean

  def corporate
    @posts = apply_scopes(Post).where(category_id: 1)
  end

  def ip
    @posts = apply_scopes(Post).where(category_id: 2)
  end

  def employment
    @posts = apply_scopes(Post).where(category_id: 3)
  end

  def real_estate
    @posts = apply_scopes(Post).where(category_id: 5)
  end

  def venture_cap
    @posts = apply_scopes(Post).where(category_id: 6)
  end
end
