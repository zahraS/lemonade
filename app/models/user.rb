class User < ActiveRecord::Base
  has_many :tasks
  has_many :pages
  has_many :notes
  has_many :comments

  has_many :follows
  has_many :followers, through: :follows

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
