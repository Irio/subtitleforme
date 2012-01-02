class Repository
  def initialize(owner)
    Git.init self.class.folder(owner)
  end

  def self.folder(owner = nil)
    Rails.root.to_s + '/repos/' + ENV["RAILS_ENV"] + ((owner and owner.persisted?) ? '/' + owner.class.to_s + '/' + owner.id.to_s : '')
  end

  def self.delete(owner)
    FileUtils.rm_rf(self.folder) if owner == :all
  end
end