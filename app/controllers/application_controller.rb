class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: %i[ username first_name
    #                                                       gender last_name email])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[username password
                                                         remember_me])
  end
end
