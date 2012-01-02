class Group < ActiveRecord::Base
  has_many :users
  has_many :subtitles
  
  validates :name, :presence => true

  def git_create
    Git.init Repository.folder(self)
  end
end
