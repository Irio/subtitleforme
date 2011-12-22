class Video < ActiveRecord::Base
  has_many :releases
  
  before_validation do
    self.errors.add(:imdb_id, 'At least one id in movies site must be added.') if not self.imdb_id and not self.tmdb_id
  end

  attr_reader :from_api, :title_original, :title, :year, :plot

  def title_original
    from_api.original_name if not from_api.nil?
  end

  def title
    from_api.name if not from_api.nil?
  end

  def year
    from_api.released.to_datetime.year if not from_api.nil?
  end

  def plot
    from_api.overview if not from_api.nil?
  end

  private
  def from_api
    if not read_attribute(:from_api)
      info = TmdbMovie.find(:imdb_id => self.imdb_id, :id => self.tmdb_id)
      unless info == []
        write_attribute(:from_api, info)
        self.tmdb_id = info.id
        self.imdb_id = info.imdb_id
      end        
    end

    read_attribute(:from_api)
  end
end
