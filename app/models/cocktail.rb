class Cocktail < ApplicationRecord
  has_one_attached :photo
  has_many :doses, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :ingredients, through: :doses, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, presence: true

  $glasses = Cocktail.distinct.order(:glass).pluck(:glass)

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: [:name],
                  associated_against: {
                    ingredients: [:name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
