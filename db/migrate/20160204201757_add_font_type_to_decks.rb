class AddFontTypeToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :font_type, :string
  end
end