class Release < ActiveRecord::Base
  belongs_to :video
  has_many :subtitles

  validates :name, :presence => true
  validates :video, :presence => true
end
