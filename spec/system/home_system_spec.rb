require "rails_helper"
RSpec.describe "Notes", :type => :system do
  let(:valid_user) {
    User.create(name: "test", email: "test@test.com", password: "testing")
  }
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


end
# find('#note-content').native.clear
# find('#note-title').native.clear
# find('#note-tags').native.clear
# fill_in('title', with: "John's note")
# fill_in('tags', with: '#John')
# fill_in('content', with: 'John lives a boring life')
