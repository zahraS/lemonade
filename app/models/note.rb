class Note < ActiveRecord::Base
  belongs_to :page
  belongs_to :user

  has_many :likes
  has_many :comments
end
