class AddAttachmentImageToCards < ActiveRecord::Migration
  def self.up
    change_table :cards do |t|
      t.attachment :cards
      add_column :cards, :image_file_name, :string
      add_column :cards, :image_content_type, :string
      add_column :cards, :image_file_size, :integer
      add_column :cards, :image_path, :string
    end
  end

  def self.down
    remove_attachment :cards, :image
    remove_column :cards, :image_file_name
    remove_column :cards, :image_content_type
    remove_column :cards, :image_file_size
    remove_column :cards, :image_path
  end
end
