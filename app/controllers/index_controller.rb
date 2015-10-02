class IndexController < ApplicationController
  skip_before_filter :authenticate_user_from_token
  
  def home
  end
end
