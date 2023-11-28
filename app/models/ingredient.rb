class Ingredient < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  #validates :category, presence: true
end
