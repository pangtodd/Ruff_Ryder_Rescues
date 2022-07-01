class Pet < ApplicationRecord
  validates :name, presence: :true
  validates :animal_type, presence: :true
end