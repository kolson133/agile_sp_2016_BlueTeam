require 'open-uri'
class Card < ActiveRecord::Base
  belongs_to :deck
  validates_presence_of :question
  validates_presence_of :answer
  attr_accessor :image, :image_remote_url
  has_attached_file :image, :styles => { :medium => "300x300>" }
  before_validation :download_remote_image, :if => :image_url_provided?
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def next
    deck.cards.where("id > ?", id).first
  end

  def previous
    deck.cards.where("id < ?", id).last
  end

  private
  def image_url_provided?
    !self.image_remote_url.blank? && URI.parse(image_remote_url).kind_of?(URI::HTTP)
  end

  private
  def download_remote_image
    self.image = URI.parse(image_remote_url)
  end

end
