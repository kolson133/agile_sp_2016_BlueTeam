class Deck < ActiveRecord::Base
  validates_presence_of :title, :author
  validates_uniqueness_of :title, scope: :user_id
  belongs_to :user
  has_many :cards
  accepts_nested_attributes_for :cards

  def share
    self.slug = SecureRandom.urlsafe_base64
  end

  def remove_shared
    self.slug = nil
  end

end
