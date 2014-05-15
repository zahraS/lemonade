class User < ActiveRecord::Base
  has_many :tasks
  has_many :pages
  has_many :notes
  has_many :comments
  has_many :birth_dates

  has_many :follows, foreign_key: :follower_id
  has_many :being_followed, class_name: Follow, foreign_key: :following_id

  has_many :followers, through: :being_followed
  has_many :followings, through: :follows

  has_one :profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_save :ensure_profile

  def ensure_profile
    Profile.create(user: self) unless profile
  end
end
