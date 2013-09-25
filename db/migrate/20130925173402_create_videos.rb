class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :file
      t.string :file_file_name
      t.string :title
      t.integer :user_id
      t.timestamps
    end
  end
end
