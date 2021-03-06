include ActionController::HttpAuthentication::Basic::ControllerMethods
include ActionController::HttpAuthentication::Token::ControllerMethods

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  before_filter :authenticate_user_from_token, :unless => :format_html?
  
  private
   
  def format_html?
    request.format.html?
  end
   
  def authenticate_user_from_token
    unless authenticate_with_http_token do |token, options| 
      @current_user = User.find_by(auth_token: token) 
    end
      render json: { error: 'Bad Token'}, status: 401
    end
  end
  
  def default_serializer_options
    { root: false }
  end

end
