class User < ActiveRecord::Base
  belongs_to :group
  has_many :subtitles

  validates :nick, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /^([0-9a-zA-Z]+([_.-]?[0-9a-zA-Z]+)*@[0-9a-zA-Z]+[0-9,a-z,A-Z,.,-]*(.){1}[a-zA-Z]{2,4})+$/ }

  before_validation do
    raise ArgumentError, 'Missing password' if not self.password
    self.password = Encryption.hash(self.password)
  end
end
