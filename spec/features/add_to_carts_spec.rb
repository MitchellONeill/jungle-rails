require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

   before :each do
      @category = Category.create! name: 'Apparel'
      1.times do |n|
        @category.products.create!(
          name: 'test_product',
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario 'adds to the cart' do
    visit '/'
    page.find('footer.actions').find_link('Add').click
    expect(page).to have_text 'My Cart (1)', count:1
    save_screenshot
  end

end
