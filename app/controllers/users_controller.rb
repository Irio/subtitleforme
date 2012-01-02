class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create params[:user]
    #@user.git_create

    redirect_to :root, :notice => 'User ' + @user.nick + ' created.'
  end

  def show
    @user = User.find(params[:id])
  end
end
