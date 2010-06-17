# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_post(post, className = nil)
    return '' if post == nil
    
    title = post.title;
    if className == 'prev'
        title = '&laquo; ' + title
    elsif className == 'next'
        title += ' &raquo;'
    end
    
    link_to title, url_to_post(post), :class => className
  end
  
  def url_to_post(post)
    return '' if post == nil
    url_for :controller => 'post', :action => 'view', :year => post.created_at.year, :month => post.created_at.month, :day => post.created_at.day, :slug => post.slug
  end
  
  def get_all_categories
    Category.find(:all, :order => 'name')
  end
end
