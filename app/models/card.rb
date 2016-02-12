class Card < ActiveRecord::Base
  belongs_to :deck
  validates_presence_of :question
  validates_presence_of :answer
  attr_accessor :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
