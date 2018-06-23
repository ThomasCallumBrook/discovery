class CountriesController < ApplicationController
  before_action :set_countries
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  # GET users/1/countries
  def index
    @countries = @user.countries
  end

  # GET users/1/countries/1
  def show
    @blogs = @country.blogs.order('created_at DESC')
  end

  # GET users/1/countries/new
  def new
    @country = @user.countries.build
  end

  # GET users/1/countries/1/edit
  def edit
  end

  # POST users/1/countries
  def create
    @country = @user.countries.build(country_params)

    if @country.save
      redirect_to([@country.user, @country], notice: 'Country was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT users/1/countries/1
  def update
    if @country.update_attributes(country_params)
      redirect_to([@country.user, @country], notice: 'Country was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE users/1/countries/1
  def destroy
    @country.destroy

    redirect_to user_countries_url(@user)
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
      params.require(:country).permit(:name, :bounds, {images: []})
    end


end
