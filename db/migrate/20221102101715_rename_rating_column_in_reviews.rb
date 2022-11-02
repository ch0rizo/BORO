class RenameRatingColumnInReviews < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :raitng, :rating
  end
end
