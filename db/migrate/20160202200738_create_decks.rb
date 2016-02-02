class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :title
      t.string :author
      t.string :category

      t.timestamps null: false
    end
  end
end
