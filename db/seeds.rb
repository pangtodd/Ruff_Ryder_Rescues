class Seed

  def self.begin
    seed = Seed.new
    seed.generate_pets
  end

  def generate_pets
    10.times do |i|
      pet = Pet.create!(
        name: Faker::Music::Hiphop.unique.artist,
        animal_type: "dog",
        breed: Faker::Creature::Dog.breed,
        adoption_status: "awaiting their forever home",
        comments: Faker::Creature::Dog.meme_phrase
      )
      puts "pet #{i}: #{pet.name} is a #{pet.breed} #{pet.animal_type}; volunteer comments: #{pet.comments}'."
    end

    10.times do |i|
      pet = Pet.create!(
        name: Faker::Music::Hiphop.unique.artist,
        animal_type: "cat",
        breed: Faker::Creature::Cat.breed,
        adoption_status: "awaiting their forever home",
        comments: Faker::Company.unique.bs
      )
      puts "pet #{i}: #{pet.name} is a #{pet.breed} #{pet.animal_type}; volunteer comments: #{pet.comments}'."
    end


  end
end

Seed.begin