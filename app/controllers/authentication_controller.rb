class AuthenticationController < ApplicationController

  def sign_in
	@user = User.new
  end


  def login
    username = params[:user][:username]
    password = params[:user][:password]
	

	
    user = User.find_by username: username
	
	if (not user.nil?)&&(user.username==username)&&(user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt))
		session[:user_id] = user.id
		if (user.role==0)
			redirect_to :controller => 'dashboard' , :action => 'index'
		elsif (user.role==1)
			redirect_to :controller => 'admin' , :action => 'admin'
		else
			flash.now[:error] = 'Obsolete user. Please sign in as another user.'
			@user = User.new
			render :action => "sign_in"	
		end
	else
		flash.now[:error] = 'Unknown user. Please check your username and password.'
		@user = User.new
		render :action => "sign_in"
	end
  end
  

  def signed_out
    session[:user_id] = nil
    flash[:notice] = "You have been signed out."
	redirect_to :controller => 'authentication', :action => 'sign_in'
  end
  


end
