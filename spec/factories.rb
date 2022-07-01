FactoryBot.define do
  factory(:cat) do
    name {Faker::Music::Hiphop.unique.artist}
    content {Faker::Movie.quote}
  end
end