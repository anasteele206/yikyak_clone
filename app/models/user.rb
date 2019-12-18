class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable
  acts_as_voter
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :yakkarma, dependent: :destroy
  after_create :create_yakkarma

end
