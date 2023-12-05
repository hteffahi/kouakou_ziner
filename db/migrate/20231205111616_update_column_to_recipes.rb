class UpdateColumnToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :image, :string
    remove_column :recipes, :duration, :integer
    remove_column :recipes, :step, :text
    remove_column :recipes, :difficulty, :integer
  end
end
