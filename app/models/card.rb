require 'open-uri'
class Card < ActiveRecord::Base
  belongs_to :deck
  attr_accessor :image, :image_remote_url, :raw_latex
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "120x120#" }
  before_validation :download_remote_image, :if => :image_url_provided?
  before_validation :download_remote_equation, :if => :raw_latex_provided?
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_size :image, :less_than => 720.kilobytes
  validates_presence_of :question, :unless => :image?
  validates_presence_of :answer

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
  def raw_latex_provided?
    !self.raw_latex.blank?
  end

  private
  def download_remote_image
    self.image = URI.parse(image_remote_url)
  end

  private
  def download_remote_equation
    url = URI.escape("http://latex.codecogs.com/png.latex?\\dpi{100}\\fn_cm \\huge " + raw_latex).encode
    self.image = URI.parse(url).open
  end

end
