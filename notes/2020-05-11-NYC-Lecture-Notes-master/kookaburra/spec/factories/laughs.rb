FactoryBot.define do
    factory :laugh do
        body { Faker::Movies::StarWars.quote }
        association :author, factory: :user
    end
end