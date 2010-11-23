class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
	print "\n\n\ninside new user session\n\n\n"
	@user_session = UserSession.new
	print "\n\n\nafter\n\n\n"
  end
  
  def create
	print "\n\n\n\ninside create\n\n\n\n"
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default notes_path
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
end