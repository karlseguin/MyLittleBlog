class HomeController < ApplicationController
  caches_action :index, :cache_path => Proc.new{|c| c.params}, :unless => Proc.new{|c| c.is_logged_in?}
  caches_action :rss, :expires_in => 1.day
  
  def index
    response.headers["Expires"] = "#{10.minutes.from_now}"
    @page = params[:page].to_i
    @page = 1 if @page == 0
    @category = params[:category] || 'all'
    category_id = Category.find_id(@category);
    
    @posts = Post.find_summary(@page, 7, category_id)
    render 'no_posts' and return if @posts == nil || @posts.length == 0
    
    @has_previous  = Post.exists? ['created_at < ? and (0 = ? or category_id = ?)', @posts.last.created_at, category_id, category_id]
    @has_next  = Post.exists? ['created_at > ? and (0 = ? or category_id = ?)', @posts.first.created_at, category_id, category_id]
  end
  
  def about
  end
  
  def rss
    response.headers["Expires"] = "#{10.minutes.from_now}"
    @posts = Post.all(:order => 'created_at desc', :limit => 10)
    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end
end