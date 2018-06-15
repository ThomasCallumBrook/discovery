require 'rails_helper'


RSpec.describe UsersController, type: :controller do

  let(:valid_user) {
      User.create!(name: "test", email: "test@test.com", password: "testing")
    }
  let(:valid_attributes) {
    {name: "test",
    email: "test@test.com",
    password: "testing"}
  }

  let(:invalid_attributes) {
    {name: ""}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "redirects if not logged in" do
      user = User.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to redirect_to("/users/sign_in")
    end
  end
end
