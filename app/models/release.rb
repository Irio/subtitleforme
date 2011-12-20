class Release < ActiveRecord::Base
  belongs_to :video

  validates :name, :presence => true
  validates :video, :presence => true
end
