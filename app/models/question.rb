class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :questioner, class_name: "User", foreign_key: :user_id
  belongs_to :favorite_answer, class_name: "Answer"

  has_many :votes, as: :votable
  has_many :answers
  has_many :comments, as: :commentable
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, :description, :user_id, presence: true


end
