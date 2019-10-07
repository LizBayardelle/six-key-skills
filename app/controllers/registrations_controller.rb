class RegistrationsController < Devise::RegistrationsController

  def create
    super
    Subscriber.each do |sub|
      if @user.email == sub.email
        sub.update_attributes(member: true)
      end
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,

      :membership,
      :contributor,
      :admin,

      :password,
      :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,

      :membership,
      :contributor,
      :admin,

      :password,
      :password_confirmation,
      :current_password)
  end
end
