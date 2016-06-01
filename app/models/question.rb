class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :answer

  has_many :comments, as: :commentable
  has_many :taggings
  
  validates :title, :description, presence: true 

end
