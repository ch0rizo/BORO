class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :raitng
      t.text :comment
      t.references :lending, null: false, foreign_key: true

      t.timestamps
    end
  end
end
