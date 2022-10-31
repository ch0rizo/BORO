class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.decimal :deposit
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
