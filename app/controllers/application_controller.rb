require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :json

  # before_action :check_profile_integrity

  layout :layout_by_resource

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  # def check_profile_integrity
  #   puts "="*80
  #   allowed_actions = ['registrations#edit', 'users#update_profile']
  #   current_action = "#{controller_name}\##{action_name}"
  #   p current_action
  #   puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> '
  #   # if !user_signed_in?
  #   #   redirect_to user("/users/register")
  #   #   return
  #   # end
  #   if user_signed_in? &&
  #     current_user.profile.display_name.blank? &&
  #     !allowed_actions.include?(current_action)
  #     redirect_to edit_user_registration_path
  #   end
  # end

  def layout_by_resource
    if user_signed_in?
      "application"
    else
      "devise"
    end
  end
end
