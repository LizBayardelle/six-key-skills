class AdminController < ApplicationController
  def blogs
    @blogs = Blog.all
  end

  def users
    @users = User.all
    @subscribers = Subscriber.all
  end

  def lead_magnets
    @lead_magnets = LeadMagnet.all
  end
end
