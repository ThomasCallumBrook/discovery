require "rails_helper"
RSpec.describe "Country", :type => :system do
  let(:valid_user) {
    User.create(name: "test", email: "test@test.com", password: "testing")
  }
  let(:valid_country) {
    Country.create!(bounds: '33.902427,67.84322900000001', name: 'Afghanistan', user: valid_user)
  }
  before do
    @user = valid_user
    @country = valid_country
    @countries = valid_user.countries
  end

  def login_as(user)
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'testing'
    click_button('Log in')
    visit '/users/1/countries/1'
  end

  it "shows the country when logged in", js: true do
    login_as(valid_user)
    expect(page).to have_text 'Add a visited region on map click!'
    save_screenshot()
  end

  it "shows the home page when clicking home", js: true do
    login_as(valid_user)
    find(".home-link a").click
    expect(page).to have_text 'EXPLORE, MORE'
  end
  it "shows the Login page when clicking logout", js: true do
    login_as(valid_user)
    find(".logout-link a").click
    expect(page).to have_text 'Log in'
  end
end
