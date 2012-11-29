class ItemsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :format_label

  def index
    @users = User.all
    @user  = params[:user_id] ? User.find(params[:user_id]) : current_user
    @item  = @user.items.build(creator_id: current_user.id)

    collection = @user.items
    collection = collection.mine if @user == current_user

    @want = collection.want
    @dont = collection.dont
  end

  def create
    user = User.find(params[:user_id])
    resource = user.items.create(params[:item])
    redirect_to user_items_path(user)
  end

  def destroy
    user = User.find(params[:user_id])
    resource = user.items.find(params[:id])
    resource.destroy
    redirect_to user_items_path(user)
  end

  def update
    user = User.find(params[:user_id])
    resource = user.items.find(params[:id])
    resource.update_attributes(params[:item])
    redirect_to user_items_path(user)
  end

  protected

  def format_label(user)
    if user == current_user
      return "My Christmas List"
    end

    "#{user.name}'s Christmas List"
  end
end
