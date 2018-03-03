class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def flash_msg(status = :notice, msg = "")
    flash[status] = msg
  end

end
