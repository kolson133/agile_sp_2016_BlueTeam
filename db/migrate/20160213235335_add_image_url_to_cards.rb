class AddImageUrlToCards < ActiveRecord::Migration
  def change
    add_column :cards, :image_remote_url, :string
  end
end
