class Images < ActiveRecord::Migration
  def change
    add_column :cards, :image, :string
  end
end
