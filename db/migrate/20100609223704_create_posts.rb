class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :slug, :limit => 50, :null => false
      t.string :title, :limit => 125, :null => false
      t.string :summary, :limit => 600, :null => false
      t.text :body, :null => false
      t.integer :category_id, :null => false
      t.datetime :created_at
    end
    
    create_table :categories do |t|
      t.string :name
    end
    
    add_index :posts, :slug, :unique => true
    add_index :posts, [:created_at, :category_id], :unique => true
  end

  def self.down
    drop_table :posts
    drop_table :categories
  end
end
