class CreateSubtitles < ActiveRecord::Migration
  def change
    create_table :subtitles do |t|
      t.references :group
      t.references :user
      t.references :release

      t.timestamps
    end
    add_index :subtitles, :group_id
    add_index :subtitles, :user_id
    add_index :subtitles, :release_id
  end
end
