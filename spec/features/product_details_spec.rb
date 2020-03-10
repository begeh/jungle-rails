require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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
  scenario "goes to product detail page" do
    # ACT
    p = Product.all.sample
    visit root_path
    # DEBUG / VERIFY
    expect(page).to have_text(p.name)

    product_elt = page.find(:xpath,"//a/h4", text: p.name)
    product_elt.click
    expect(page).to have_selector 'section.products-show'
    puts page.html
  end
end
