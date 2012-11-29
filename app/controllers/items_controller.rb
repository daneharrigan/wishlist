class ItemsController < ApplicationController
  before_filter :authenticate_user!

  def index
    user = params[:user_id] ? User.find(params[:user_id]) : current_user
    collection = user.items
    collection = collection.mine if user == current_user

    @want = collection.want
    @dont = collection.dont
  end

  def create
    user = User.find(parmas[:user_id])
    resource = user.items.create(params[:item])
    redirect_to user_items_path(user)
  end

  def destroy
    user = User.find(parmas[:user_id])
    resource = user.items.find(params[:id])
    resource.destroy
    render nothing: true
  end

  def update
    user = User.find(parmas[:user_id])
    resource = user.items.find(params[:id])
    resource.update_attributes(params[:item])
    redirect_to user_items_path(user)
  end
end
