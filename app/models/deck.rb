class Deck < ActiveRecord::Base
  validates_presence_of :title, :author
  validates_uniqueness_of :title
  has_many :cards
  accepts_nested_attributes_for :cards

  def share
    self.slug = SecureRandom.urlsafe_base64
  end

end
