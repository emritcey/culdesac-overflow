class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    password = Password.create(new_password)
    self.password_hash = password
  end

  def authenticate(pass)
    self.password == pass
  end
end
