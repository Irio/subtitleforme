class Repository
  def self.folder(owner = nil)
    Rails.root.to_s + '/repos/' + ENV["RAILS_ENV"] + '/' + owner.class.to_s + '/' + ((owner and owner.persisted?) ? owner.id.to_s : '')
  end

  def self.delete(owner)
    FileUtils.rm_rf folder if owner == :all
  end
end