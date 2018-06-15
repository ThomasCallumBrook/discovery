require 'rails_helper'

RSpec.describe CountriesController, type: :controller do
  let(:valid_user) {
    User.create(name: "test", email: "test@test.com", password: "testing")
  }
  let(:valid_attributes) {
    {name: "test",
    bounds: "12,14",
    user: valid_user  }
  }

  let(:invalid_attributes) {
    {name: ""}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      country = Country.create! valid_attributes
      get :index, params: {:user_id => valid_user.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      country = Country.create! valid_attributes
      get :show, params: {:user_id => valid_user.id, id: country.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {:user_id => valid_user.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      country = Country.create! valid_attributes
      get :edit, params: {:user_id => valid_user.id, id: country.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Country" do
        expect {
          post :create, params: {:user_id => valid_user.id, id: country.to_param, country: valid_attributes}, session: valid_session
        }.to change(Country, :count).by(1)
      end

      it "redirects to the created country" do
        post :create, params: {:user_id => valid_user.id, id: country.to_param, country: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Country.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {:user_id => valid_user.id, id: country.to_param, country: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: "test2",
        bounds: "12,15"}
      }

      it "updates the requested country" do
        country = Country.create! valid_attributes
        put :update, params: {:user_id => valid_user.id, id: country.to_param, user_country: new_attributes}, session: valid_session
        country.reload
        expect(country.name).to eq("test2")
      end

      it "redirects to the country" do
        country = Country.create! valid_attributes
        put :update, params: {:user_id => valid_user.id, id: country.to_param, country: valid_attributes}, session: valid_session
        expect(response).to redirect_to("/users/#{valid_user.id}/countries/#{country.id}")
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        country = Country.create! valid_attributes
        put :update, params: {:user_id => valid_user.id, id: country.to_param, country: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested country" do
      country = Country.create! valid_attributes
      expect {
        delete :destroy, params: {:user_id => valid_user.id, id: country.to_param}, session: valid_session
      }.to change(Country, :count).by(-1)
    end

    it "redirects to the countries list" do
      country = Country.create! valid_attributes
      delete :destroy, params: {:user_id => valid_user.id, id: country.to_param}, session: valid_session
      expect(response).to redirect_to("/users/#{valid_user.id}/countries")
    end
  end

end
