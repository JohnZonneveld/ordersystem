class SessionController < ApplicationController

	def new
    end
    

    def oauth_login
        user = User.find_or_create_by(email: auth.email)
        if !user.password_digest
            user.password = SecureRandom.hex
            user.name = auth.name
            user.save
        end
        session[:user_id] = user.id
        redirect_to root_path
    end

    def create
        byebug
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "username/password didn't match our records"
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
        request.env['omniauth.auth'].info
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
	  
end
