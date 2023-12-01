class Ingredient < ApplicationRecord
  belongs_to :user

  VALID_UNITS = %w(tsp tbsp cup oz lb t pc)
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :unit, inclusion: { in: VALID_UNITS }

  def self.valid_units
    VALID_UNITS
  end

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [:name],
    using: {
      tsearch: { prefix: true }
    }
end
