class Post < ActiveRecord::Base
  has_one :category
  
  def self.find_summary(page, limit, category_id)
    conditions = []
    arguments = {}
    
    if category_id != 0 
      conditions << ['category_id = :category_id']
      arguments[:category_id] = category_id      
    end
    
    Post.find :all, 
              :select => 'id, slug, title, created_at, summary', 
              :conditions => [conditions.join(' AND '), arguments], 
              :order => 'created_at desc', 
              :offset => (page-1) * limit, :limit => limit
  end
end
