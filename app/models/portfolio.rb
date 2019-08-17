class Portfolio < ApplicationRecord
  validates_presence_of :title, :body
  extend FriendlyId
  friendly_id :title, use: :slugged

  def self.angular
    where(subtitle: "Angular")
  end

  scope :Ruby_on_Rails, lambda { where(subtitle: "Ruby on Rails") }
end
