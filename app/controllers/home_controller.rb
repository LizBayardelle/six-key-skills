class HomeController < ApplicationController
  def index
    @blogs = Blog.where(published: true).order("created_at DESC").limit(6)
  end
end
