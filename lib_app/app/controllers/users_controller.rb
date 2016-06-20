class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]

  #grab the users
  def index
    #the @sign allows you to carry over the given data into the index
    @users = User.all
    render :index
  end

  def new
    # new user being created to render in the 'new' form
    @user = User.new
    render :new
  end

  def create
    # requiring given parameters
    @user = User.create(user_params)
    login(@user) # <--login the user
    redirect_to "/users#{user.id}"  # <--go to show
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
