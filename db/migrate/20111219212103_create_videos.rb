class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :imdb_id
      t.string :tmdb_id

      t.timestamps
    end
  end
end
