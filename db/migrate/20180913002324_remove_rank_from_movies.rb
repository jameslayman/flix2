class RemoveRankFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :rank, :string
  end
end
