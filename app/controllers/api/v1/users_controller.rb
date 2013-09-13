class Api::V1::UsersController < ApplicationController
  respond_to :json

  def index
    if params
      hash = {}
      attributes = User.column_names & params.keys
      attributes.each do |attribute|
        hash.merge!("#{attribute}_cont".to_sym => params[attribute.to_sym])
      end
      @users = User.search(hash).result(distinct: true)
    else
      @users = User.all
    end
    respond_with :api, :v1, @users
  end

  def show
    respond_with :api, :v1, User.find(params[:id])
  end

  def create
    respond_with :api, :v1, User.create(user_params)
  end

  def update
    respond_with :api, :v1, User.update(params[:id], user_params)
  end

  def destroy
    respond_with :api, :v1, User.destroy(params[:id])
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :name, :image)
    end
end
