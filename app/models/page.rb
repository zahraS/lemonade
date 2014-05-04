class Page < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  
  def to_param
  	published_at.strftime("%F")
  end
end
