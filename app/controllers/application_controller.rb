class ApplicationController < ActionController::Base
  before_action :new_subscriber

  def new_subscriber
    @new_subscriber = Subscriber.new
  end 

end
