class Card < ActiveRecord::Base
  belongs_to :deck
  validates_presence_of :question
  validates_presence_of :answer
  attr_accessor :image
  has_attached_file :image, :styles => { :medium => "300x300>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
