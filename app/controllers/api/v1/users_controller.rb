class Api::V1::UsersController < InheritedResources::Base
skip_before_filter  :authenticate_user_from_token, :only => [:create]

  # POST /users
  # POST /users.json
  def create
    @user = User.create! user_params
    render json: { data: { auth_token: @user.auth_token }}
  
  end
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    render json: @users
  end
  
  rescue_from ActiveRecord::RecordInvalid do
    render :text => 'Ya done screwed up', :success => false, :status => :unprocessable_entity
  end
  
  private
  

  def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, 
      :username, :auth_token)
  end
end

