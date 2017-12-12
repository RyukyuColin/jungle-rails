require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!(
      first_name: 'Tom',
      last_name: 'Toms',
      email: 'tom@gmail.com',
      password: '12345678',
      password_confirmation: '12345678'
    )

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

  scenario "They complete successfully log in" do

  # ACT
  visit root_path
  visit '/login'

  within 'form' do
    fill_in id: 'email', with: 'tom@gmail.com'
    fill_in id: 'password', with: '12345678'

    click_button 'Submit'
  end

  # DEBUG
  save_screenshot

  expect(page).to have_content 'Signed in as Tom'

  end
end
