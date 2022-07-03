class Pet < ApplicationRecord
  validates :name, presence: :true
  validates :animal_type, presence: :true

  # scope :search, -> (value) {where(name ILIKE ?, '#{ value }' )}

  def self.name_search(value)
    @results = Pet.where("name ILIKE ?", value)
  end

  def self.type_search(value)
    @results = Pet.where("animal_type ILIKE ?", value)
  end
end