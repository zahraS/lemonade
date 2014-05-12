class Emotion < ActiveRecord::Base
  belongs_to :page

  validates :emotion_type, inclusion: { in: ["happy", "sad", "funny"] }
end
