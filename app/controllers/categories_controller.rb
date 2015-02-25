class CategoriesController < ApplicationController

  has_scope :recent, :type => :boolean
  has_scope :popular, :type => :boolean
  has_scope :unanswered, :type => :boolean

  def search
    @posts
  end

  def show_all
    @posts = apply_scopes(Post).all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def corporate
    @posts = apply_scopes(Post).where(category_id: 1).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def ip
    @posts = apply_scopes(Post).where(category_id: 2).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def employment
    @posts = apply_scopes(Post).where(category_id: 3).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def real_estate
    @posts = apply_scopes(Post).where(category_id: 5).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def venture_cap
    @posts = apply_scopes(Post).where(category_id: 6).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end
end
