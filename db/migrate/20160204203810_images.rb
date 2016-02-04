class Images < ActiveRecord::Migration
  def change
    add_column :decks, :image, :string
  end
end
