class Cocktail < ActiveRecord::Base
  has_attachment :photo

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews

  validates :name, presence: true, uniqueness: true
end
