class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :name
      t.references :video

      t.timestamps
    end
    add_index :releases, :video_id
  end
end
