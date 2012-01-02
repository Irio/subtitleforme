class GroupsController < ApplicationController
  def new
  end

  def create
    @group = Group.create params[:group]
    @group.git_create

    redirect_to group_path(@group), :notice => 'Group ' + @group.name + ' created.'
  end

  def show
    @group = Group.find(params[:id])
  end

end
