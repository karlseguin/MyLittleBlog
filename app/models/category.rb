class Category < ActiveRecord::Base
  def self.find_id(name)
    category = Category.first(:select => 'id', :conditions => { :name => name.downcase })
    return category == nil ? 0 : category.id
  end
end