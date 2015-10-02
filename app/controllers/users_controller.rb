class UsersController < InheritedResources::Base
skip_before_filter  :authenticate_user_from_token, :only => [:signup]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    render json: @users
  end
  
  # POST /users/signup
  # POST /users/signup.json
  def signup
      User.create! user_params
      render :text => "Your name has been entered, but we have not returned to you a token.  should probably work on doing that...", :success => true
  
  end
  
  rescue_from ActiveRecord::RecordInvalid do
    render :text => 'Ya done screwed up', :success => false, :status => :unprocessable_entity
  end
  
  private
  

  def user_params
      params.require(:user).permit(:email, :password, :auth_token)
  end
end

