class PegawaiController < ApplicationController
before_filter :authenticate_user

  def authenticate_user
    if current_user.nil? || (current_user.role!=0)
      flash[:error] = 'You must be signed in as admin to view that page.'
      redirect_to :controller => 'authentication' , :action => 'sign_in'
	else
	  flash[:notice] = 'Welcome ' + current_user.username
	end
  end
  
  def index
	client = Mysql2::Client.new(host: "localhost", username: "root", password: "", database: "pemda")
    @dataAgama = client.query("SELECT * FROM agama")
  end
end
