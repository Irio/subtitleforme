class Group < ActiveRecord::Base
  has_many :users
  has_many :subtitles
  
  validates :name, :presence => true

  after_save do
    repository = Repository.new(self)
  end
end
