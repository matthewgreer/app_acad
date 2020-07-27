FactoryBot.define do 
    factory :user do # this :user should match the model name
        username { Faker::Movies::StarWars.character }
        password { "starwars" }
        association :location, factory: :location
                        # 1                 # 2
        # :location is mentioned twice on line 5
            # 1. name of the belongs_to association on the User model (only `belongs_to` associations are required for creating a user)
            # 2. name of the :location factory that we're using to generate an associated location instance
    end
end