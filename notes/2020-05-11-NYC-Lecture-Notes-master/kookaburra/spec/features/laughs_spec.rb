require "rails_helper"

# `feature` = Capybara's version of `describe`
feature "creating a laugh", type: :feature do
    before :each do
        create :user
        sign_in_user(User.last) # use helper method from spec_helper.rb
        visit new_laugh_url # use built-in Capybara method (`visit`) to simulate navigating to the new laugh form
    end

    # `scenario` = Caypbara's version of `it`
    scenario "takes a body" do
        expect(page).to have_content("Create a Laugh")
        expect(page).to have_content("Body")
    end

    scenario "takes user back to the laugh show page" do
        make_laugh("new laugh")
        expect(page).to have_content("new laugh")
    end
end

feature "deleting a laugh", type: :feature do
    before :each do
        create :user
        sign_in_user(User.last)
        make_laugh("another laugh")
        click_button("Delete this Laugh :(")
    end
    
    scenario "user deletes a laugh" do
        expect(page).to_not have_content("another laugh")
        expect(page).to have_content("All the Laughs")
    end
end