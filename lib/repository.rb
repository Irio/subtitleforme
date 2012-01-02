class Repository
  def self.folder(user = nil)
    Rails.root.to_s + '/repos/' + ENV["RAILS_ENV"] + '/users/' + (user ? user.id.to_s : '')# unless not user.persisted?
  end

  def self.delete(user)
    FileUtils.rm_rf folder if user == :all
  end
end