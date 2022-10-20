class ApplicationController < ActionController::Base
  def current_user
    @curren_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate?
    redirect_to root_path unless current_user.present?
  end
end
