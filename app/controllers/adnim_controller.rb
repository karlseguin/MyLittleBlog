class AdnimController < AuthenticatedController
  layout 'admin' 
  
  def index
    @page = params[:page].to_i
    @page = 1 if @page == 0
    @posts = Post.find_summary(@page, 20, 0)
  end
  
  def view
    id = params[:id].to_i
    @post = id == 0 ? Post.new : Post.find(id)
  end
  
  def save_post
    new_category = params.delete :new_category
    id = params[:post].delete :id
    if id.to_i > 0 
      post = Post.find(id)
      post.update_attributes(params[:post])
    else
      post = Post.create(params[:post])
    end
    if (new_category != '')
        category = Category.new
        category.name = new_category
        category.save!
        post.category_id = category.id
    end
    post.save!
    clear_cache
    redirect_to :action => 'index'
  end
  
  def delete
    Post.delete(params[:id])
    clear_cache
    redirect_to :action => 'index'
  end
  
  private
    def clear_cache
      FileUtils.touch(RAILS_ROOT + '/tmp/restart.txt')
    end

end