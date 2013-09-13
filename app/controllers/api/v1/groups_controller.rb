class Api::V1::GroupsController < ApplicationController
  respond_to :json

  def index
    respond_with :api, :v1, Group.all
  end

  def show
    respond_with :api, :v1, Group.find(params[:id])
  end

  def create
    respond_with :api, :v1, Group.create(group_params)
  end

  def update
    respond_with :api, :v1, Group.update(params[:id], group_params)
  end

  def destroy
    respond_with :api, :v1, Group.destroy(params[:id])
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name)
    end
end
