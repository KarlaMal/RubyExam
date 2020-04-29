class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :people_liked, through: :likes, source: :user

  validates :content, presence: true, length: { minimum: 3 }
end
