class AddIsDisabledToCards < ActiveRecord::Migration
  def change
    add_column :cards, :is_disabled, :boolean, default: false
  end
end
