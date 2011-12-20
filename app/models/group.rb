class Group < ActiveRecord::Base
  has_many :users
  has_many :subtitles
  
  validates :name, :presence => true
end
