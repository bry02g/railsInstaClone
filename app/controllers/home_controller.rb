class HomeController < ApplicationController
    def index
        if !user_signed_in?
            redirect_to new_user_session_path
        else
            @home = true
            @posts = Post.all.reverse
        end
    end
end