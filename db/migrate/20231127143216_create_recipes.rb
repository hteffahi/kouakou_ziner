class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :duration
      t.text :step
      t.integer :difficulty
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
