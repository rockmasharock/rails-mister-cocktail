class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true, uniqueness: true, allow_blank: false
  validates :cocktail, allow_blank: false, presence: true
  validates :ingredient, allow_blank: false, presence: true
end
