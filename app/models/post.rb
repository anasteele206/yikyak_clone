class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  acts_as_votable


  validates_length_of :text, maximum: 200, allow_blank: false
  validates_presence_of :lat, :long, message: "Unable to get your location"
end
