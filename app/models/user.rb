class User < ActiveRecord::Base
  has_many :tasks
  has_many :pages
  has_many :notes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
