class Page < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  has_many :emotions
  
  def to_param
  	published_at.strftime("%F")
  end
end
