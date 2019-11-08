class UsersController < ApplicationController
  before_action :only_self, only: [:show]
  before_action :admin_only, only: [:index]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @admin = User.where(admin: true)
  end

  def make_contributor
    @user = User.find(params[:id])
    if @user.update_attributes(contributor: true, contributor_since: Date.today)
      redirect_back(fallback_location: users_path)
      flash[:notice] = "That user is now a contributor!"
    end
  end

  def only_self
    @user = User.find(params[:id])
    unless current_user && ( @user.id == current_user.id || current_user.admin )
      redirect_back(fallback_location: root_path)
      flash[:warning] = "Sorry, you can only access your own user page."
    end
  end

  def admin_only
    unless current_user && current_user.admin
      redirect_back(fallback_location: root_path)
      flash[:warning] = "Sorry, you must be an administrator to access that page."
    end
  end

end
