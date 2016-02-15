class AddForegroundColorToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :foreground_color, :string
  end
end
