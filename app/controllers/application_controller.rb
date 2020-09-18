class ApplicationController < ActionController::Base
  before_action :new_subscriber

  def admin_only
    unless current_user && current_user.admin
      redirect_to root_path
      flash[:warning] = 'Sorry, you have to be an administrator to access that page.'
    end
  end

  def new_subscriber
    @new_subscriber = Subscriber.new
  end

end
