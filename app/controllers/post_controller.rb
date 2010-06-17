class PostController < ApplicationController
  caches_action :view, :cache_path => Proc.new{|c| c.params}, :expires_in => 6.hours
  
  def view
    response.headers["Expires"] = "#{10.minutes.from_now}"
    @post = Post.find(:first, :conditions => { :slug => params[:slug].downcase })

    redirect_to :controller => 'home' and return if @post == nil
    
    @previous = Post.find(:first, :select=> 'title, created_at, slug', :conditions => ['created_at < ?', @post.created_at], :order => 'created_at desc')
    @next = Post.find(:first, :select=> 'title, created_at, slug', :conditions => ['created_at > ?', @post.created_at], :order => 'created_at')
  end
end