class UsersController < Frack::BaseController
  def index
    @users = User.all
    render 'users/index'
  end
end
