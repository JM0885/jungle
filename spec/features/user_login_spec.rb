
require "rails_helper"

RSpec.feature "UserLogins", type: :feature, js: true do

  # setup
  before :each do
    User.create!(
      first_name: "User",
      last_name: "testUser",
      email: "test@test.com",
      password: "password",
      password_confirmation: "password",
    )
  end

  scenario "They see all products" do
    # act
    visit login_path

    # verify
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "password"

    click_button("Submit")

    expect(page).to have_content("Signed in as User")

    # debug
    save_screenshot
  end
end
