class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, class_name: "User"
  validates :description, :user_id, presence: true
end

