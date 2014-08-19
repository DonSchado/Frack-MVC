class UsersController < Frack::BaseController
  def index
    @users = User.all
    render
  end
end
