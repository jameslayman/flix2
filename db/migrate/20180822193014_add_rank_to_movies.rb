class AddRankToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :rank, :string
  end
end
