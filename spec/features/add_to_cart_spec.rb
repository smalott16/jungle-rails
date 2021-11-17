require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  
  scenario "They click a product and it takes them to the specific product page" do
    visit root_path

    #click_on "Details"
    first('article button').click
    
    #Debugging
    # sleep 0.1 #need a sleep to allow the page to load - apparently not needed for the assention
    # puts page.html
    # save_screenshot
    
    expect(page).to have_text ' My Cart (1) '
  end
  
end
