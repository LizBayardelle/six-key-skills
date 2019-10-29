class AdminController < ApplicationController
  def blogs
    @blogs = Blog.all
  end

  def users
    @users = User.all
    @subscribers = Subscriber.all
  end

  def resources
    @resources = Resource.all
  end
end
