class AdminController < ApplicationController
  before_action :admin_only

  def blogs
    @blogs = Blog.all
  end

  def users
    @users = User.all
    @subscribers = Subscriber.all
    @preauthorizations = Preauthorization.all
    @new_preauthorization = Preauthorization.new
  end

  def resources
    @resources = Resource.all
  end

  def courses
    @courses = Course.all
  end

  def admin_only
    unless current_user && current_user.admin
      redirect_back(fallback_location: root_path)
      flash[:warning] = "Sorry, you must be an administrator to access that page."
    end
  end
end
