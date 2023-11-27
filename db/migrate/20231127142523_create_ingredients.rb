class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.date :expiration
      t.integer :amount
      t.string :unit
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
