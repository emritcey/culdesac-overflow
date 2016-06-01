class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :questioner
  belongs_to :favorite_answer, class_name: "Answer"

  has_many :answers
  has_many :comments, as: :commentable
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, :description, :user_id, presence: true
end
