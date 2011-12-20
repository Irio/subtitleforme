class Video < ActiveRecord::Base
  has_many :releases
  
  before_validation do
    self.errors.add(:imdb_id, 'At least one id in movies site must be added.') if not self.imdb_id and not self.tmdb_id
  end
end
