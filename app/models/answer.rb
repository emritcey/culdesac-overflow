class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :answerer, class_name: "User", foreign_key: :user_id
  belongs_to :question
  has_many   :comments, as: :commentable
  has_many   :votes, as: :votable

  validates :description, :user_id, :question_id, presence: true

  def points
    votes.sum(:value)
  end

end
