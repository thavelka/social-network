class ProfilesController < ApplicationController
  
  before_filter :require_login
  
  def show

    @user = User.find_by_profile_name(params[:id])
    if @user
      @statuses = @user.statuses.all
      render action: :show
    else
      render file: 'public/404', status: 404, formats: [:html]  
    end
  end
  
  def require_login
    unless user_signed_in?
      redirect_to welcome_home_path
    end
  end
  
  
end
