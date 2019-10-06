class AdminController < ApplicationController
  def blogs
    @blogs = Blog.all
  end

  def users
    @users = User.all
  end
end
