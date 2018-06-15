class UsersController < ApplicationController
 before_action :require_login, only: [:index]
  def index
    @user = current_user.to_json
    @countries = current_user.countries.all.to_json
  end

end
