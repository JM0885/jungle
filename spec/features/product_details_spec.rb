
require "rails_helper"

RSpec.feature "Visitor click one of the product partials and get to new page", type: :feature, js: true do

  # setup
  before :each do
    @category = Category.create! name: "Apparel"

    @category.products.create!(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset("apparel1.jpg"),
      quantity: 10,
      price: 64.99,
    )
  end

  scenario "They see all products" do
    # act
    visit root_path

    # verify
    find("a.btn-default").click

    expect(page).to have_content("Description")

    # debug
    save_screenshot
  end
end
