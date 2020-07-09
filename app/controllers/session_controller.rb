class SessionController < ApplicationController

	def new
    end
    

    def oauth_login
        user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.password = SecureRandom.hex
            u.username = auth['info']['email'].split('@').first
            u.name = auth['info']['name']
            u.email = auth['info']['email']
        end
        session[:user_id] = user.id
        redirect_to user_path(user)
    end

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "username/password combination didn't match our records"
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end

  	def home
    	if session[:user_id]
      		@user = User.find(session[:user_id])
    	end
	end

	private

    def auth
        request.env['omniauth.auth']
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
	  
end
