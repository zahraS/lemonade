class RegistrationsController < Devise:: RegistrationsController

  before_filter :fff, if: :devise_controller?

  def create
    super
  end

  def after_sign_up_path_for(resource)
    #redirect_to "/users/edit"
    # if resource_or_scope.is_a?(User)
    #   redirect_to edit_user_registration_path
    #   return
    # else
    #   super
    # end
  end

  def fff
    devise_parameter_sanitizer.for(:sign_up) {|u| 
      u.permit(:email, :password, :password_confirmation, :remember_me)}
  end

end