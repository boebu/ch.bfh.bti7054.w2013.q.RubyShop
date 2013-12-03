class ApplicationController < ActionController::Base
  include TheRoleController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def access_denied
    return render(text: 'access_denied:  not sufficient permissions')
  end

  alias_method :login_required,     :authenticate_user!
  alias_method :role_access_denied, :access_denied

end
