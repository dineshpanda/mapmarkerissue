class ApplicationController < ActionController::Base
  before_action :authenticate_employee!
  rescue_from UncaughtThrowError do |e|
    redirect_to root_path if e.tag == :warden
  end


  

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:name, :emp_id, :emp_type, :photo])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:name, :emp_id, :emp_type, :photo])
  end
end
