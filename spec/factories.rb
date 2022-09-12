FactoryBot.define do
  factory (:pet) do
    
    name {Faker::Music::Hiphop.unique.artist}
    animal_type {"dog"}
    breed {Faker::Creature::Dog.breed}
    adoption_status {"awaiting their forever home"}
    comments {Faker::Creature::Dog.meme_phrase}
  end
end