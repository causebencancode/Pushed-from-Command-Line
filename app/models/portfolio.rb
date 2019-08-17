class Portfolio < ApplicationRecord
  validates_presence_of :title, :body
  extend FriendlyId
  friendly_id :title, use: :slugged

  def self.angular
    where(subtitle: "Angular")
  end

  scope :Ruby_on_Rails, lambda { where(subtitle: "Ruby on Rails") }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "http://placehold.it/600x400"
    self.thumb_image ||= "http://placehold.it/350x200"
  end
end 



 