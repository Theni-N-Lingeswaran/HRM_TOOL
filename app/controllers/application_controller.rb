class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  layout :determine_layout

  private

  def determine_layout
    module_name = self.class.to_s.split("::").first
    return (['Devise', 'Users'].include?(module_name) ? "devise" : "application")
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :contact_number, :password)
    end

    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :contact_number, :password, :password_confirmation)
    end
  end
end
