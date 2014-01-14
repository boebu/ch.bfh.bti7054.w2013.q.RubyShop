class ApplicationController < ActionController::Base
  include TheRoleController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale
  before_filter :create_user_info

  def access_denied
    return render(text: 'access_denied:  not sufficient permissions')
  end

  # sets language
  def set_locale
    if session[:language_id].nil?
      session[:language_id] = Language.first.id
    end
    if Language.find(session[:language_id]).language == 'de'
      I18n.locale = :de
    else
      I18n.locale = :en
    end
  end

  # creates an empty user_info if it does not exist
  def create_user_info
    if user_signed_in? and !current_user.user_info
      current_user.user_info = UserInfo.new
    end
  end

  alias_method :login_required,     :authenticate_user!
  alias_method :role_access_denied, :access_denied

end
