require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  let(:valid_user) {
    User.create(name: "test", email: "test@test.com", password: "testing")
  }
  let(:valid_country) {
    Country.create(name: "test", bounds: "12,14", user: valid_user)
  }

  let(:valid_attributes) {
    {title: "test",
    post: "Whole load of writingWhole load of writingWhole load of writingWhole load of writingWhole load of writingWhole load of writingWhole load of writingWhole load of writingWhole load of writingWhole load of writingWhole load of writing",
    country: valid_country  }
  }
  let(:invalid_attributes) {
    {title: ""}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BlogsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      blog = Blog.create! valid_attributes
      get :index, params: {:user_id => valid_user.id, :country_id => valid_country.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      blog = Blog.create! valid_attributes
      get :show, params: {:user_id => valid_user.id, :country_id => valid_country.id, id: blog.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {:user_id => valid_user.id, :country_id => valid_country.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      blog = Blog.create! valid_attributes
      get :edit, params: {:user_id => valid_user.id, :country_id => valid_country.id, id: blog.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Blog" do
        expect {
          post :create, params: {:user_id => valid_user.id, :country_id => valid_country.id, blog: valid_attributes}, session: valid_session
        }.to change(Blog, :count).by(1)
      end

      it "redirects to the created blog" do
        post :create, params: {:user_id => valid_user.id, :country_id => valid_country.id, blog: valid_attributes}, session: valid_session
        expect(response).to redirect_to("users/#{valid.user.id}/countries/#{valid.country.id}/blogs/#{Blog.last.id}")
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {:user_id => valid_user.id, :country_id => valid_country.id, blog: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {title: "what",
        post: "why"}
      }

      it "updates the requested blog" do
        blog = Blog.create! valid_attributes
        put :update, params: {:user_id => valid_user.id, :country_id => valid_country.id, id: blog.to_param, blog: new_attributes}, session: valid_session
        blog.reload
        expect(blog.title).to eq("what")
        expect(blog.post).to eq("why")
      end

      it "redirects to the blog" do
        blog = Blog.create! valid_attributes
        put :update, params: {:user_id => valid_user.id, :country_id => valid_country.id, id: blog.to_param, blog: valid_attributes}, session: valid_session
        expect(response).to redirect_to(blog)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        blog = Blog.create! valid_attributes
        put :update, params: {:user_id => valid_user.id, :country_id => valid_country.id, id: blog.to_param, blog: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested blog" do
      blog = Blog.create! valid_attributes
      expect {
        delete :destroy, params: {:user_id => valid_user.id, :country_id => valid_country.id, id: blog.to_param}, session: valid_session
      }.to change(Blog, :count).by(-1)
    end

    it "redirects to the blogs list" do
      blog = Blog.create! valid_attributes
      delete :destroy, params: {:user_id => valid_user.id, :country_id => valid_country.id, id: blog.to_param}, session: valid_session
      expect(response).to redirect_to(blogs_url)
    end
  end

end
