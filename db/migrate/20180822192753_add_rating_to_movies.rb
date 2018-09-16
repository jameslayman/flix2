class AddRatingToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :rating, :string
  end
end
