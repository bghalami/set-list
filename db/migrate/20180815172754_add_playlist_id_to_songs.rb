class AddPlaylistIdToSongs < ActiveRecord::Migration[5.2]
  def change
                # table, column, datatype
    add_column :songs, :playlist_id, :integer
  end
end
