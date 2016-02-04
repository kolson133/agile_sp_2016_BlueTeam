class AddColorTypeToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :color_type, :string
  end
end
