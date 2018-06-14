class UsersController < ApplicationController
 before_action :require_login, only: [:index]
  def index
    @users = User.all
    @user = current_user.to_json
    if current_user
      @countries = current_user.countries.all.to_json
    end
    @test = {name: 'Hello world'}
    @test2 = @test.to_json
  end

end
