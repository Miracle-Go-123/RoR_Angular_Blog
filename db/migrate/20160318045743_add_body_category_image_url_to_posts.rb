class AddCategoryImageUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :category, :string
    add_column :posts, :image_url, :string
  end
end
