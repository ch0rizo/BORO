class AddReviewsToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :rating, :decimal
    add_column :items, :review, :text
  end
end
