require "rails_helper"
RSpec.describe "Home", :type => :system do
  let(:valid_user) {
    User.create(name: "test", email: "test@test.com", password: "testing")
  }
  let(:valid_country) {
    Country.create!(boundaries: {"_southWest":{"lat":29.318572,"lng":60.52843},"_northEast":{"lat":38.486282,"lng":75.158028}},
       name: 'Afghanistan', user: valid_user)
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
  end

  it "redirects to sign_in when not logged in", js: true do
    visit '/'
    expect(page).to have_text 'Log in'
  end
  it "shows the homepage when logged in", js: true do
    login_as(valid_user)
    visit '/'
    expect(page).to have_text 'EXPLORE, MORE'
  end
  it "shows the country page when clicking on leaflet popup", js: true do
    login_as(valid_user)
    page.execute_script('window.scrollTo(0,100000)')
    find(".leaflet-interactive", match: :first).click
    find(".leaflet-popup-content a", match: :first).click
    expect(page).to have_text 'Add a visited region on map click!'
  end
  describe "country page" do
    before do
      login_as(valid_user)
      visit '/users/1/countries/1'
    end
    it "shows the country when logged in", js: true do
      expect(page).to have_text 'Add a visited region on map click!'
      save_screenshot()
    end

    it "shows the home page when clicking home", js: true do
      find(".home-link a").click
      expect(page).to have_text 'EXPLORE, MORE'
    end

    it "shows the Login page when clicking logout", js: true do
      find(".logout-link a").click
      expect(page).to have_text 'Log in'
    end
  end

end
