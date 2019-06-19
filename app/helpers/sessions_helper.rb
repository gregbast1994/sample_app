module SessionsHelper

    #logs in the given user
    def log_in(user)
        session[:user_id] = user.id
    end

    #returns current user if logged in
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end


end
