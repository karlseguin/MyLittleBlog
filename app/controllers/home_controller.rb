class HomeController < ApplicationController
  caches_action :index, :cache_path => Proc.new{|c| c.params}
  caches_action :rss, :expires_in => 1.day
  
  def index
    response.headers["Expires"] = "#{10.minutes.from_now}"
    @page = params[:page].to_i
    @page = 1 if @page == 0
    @category = params[:category] || 'all'

    @posts = Post.find_summary(@page, 5, @category)
    render 'no_posts' and return if @posts == nil || @posts.length == 0
    
    @has_previous  = Post.exists? ['created_at < ?', @posts.last.created_at]
    @has_next  = Post.exists? ['created_at > ?', @posts.first.created_at]
  end
  
  def rss
    response.headers["Expires"] = "#{10.minutes.from_now}"
    @posts = Post.find(:all, :order => 'created_at desc', :limit => 10)
    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end
end