class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  has_many :likes_counter, through: :likes

  validates :name, :alias, presence: true, length: { minimum: 3 }
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
