class CountriesController < ApplicationController
  before_action :set_countries
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  # GET users/1/countries
  def index
    @countries = @user.countries
  end

  # GET users/1/countries/1
  def show
    @blogs = @country.blogs.order('created_at DESC')
  end

  # POST users/1/countries
  def create
    @country = @user.countries.build(country_params)

    if @country.save
      redirect_to([@country.user, @country], notice: 'Country was successfully created.')
    end
  end

  # # PUT users/1/countries/1
  def update
    if @country.update_attributes(country_params)
      redirect_to([@country.user, @country], notice: 'Country was successfully updated.')
    else
      redirect_to([@country.user, @country], notice: 'Unsupported image type! Please choose from: jpg, jpeg, gif, or png')
    end
  end

  # DELETE users/1/countries/1
  def destroy
    @country.destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_countries
      @user = User.find(params[:user_id])
    end

    def set_country
      @country = @user.countries.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def country_params
      params.require(:country).permit({images: []}, {boundaries: {}}, :name)
    end

    # Prevent anyone but the correct user from altering/viewing countries
    def correct_user
      redirect_to root_url if current_user.id != @user.id
    end

end
