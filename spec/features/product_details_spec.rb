require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

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

  scenario 'navigates to products page from root' do
    visit '/'
    within('.products') do
      page.click_link 'test_product'
    end
    expect(page).to have_css('h4', text: 'test_product')
    save_screenshot
    puts page.html
  end

end
