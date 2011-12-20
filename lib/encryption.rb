class Encryption
  require 'digest/md5'

  def self.hash(string)
    Digest::MD5.hexdigest(string)
  end
end