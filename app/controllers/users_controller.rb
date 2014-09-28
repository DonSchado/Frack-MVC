class UsersController < Frack::BaseController
  def index
    @users = User.all
  end
end
