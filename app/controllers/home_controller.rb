class HomeController < ApplicationController
    def index
        if user_signed_in?
            redirect_to user_posts_path(current_user)
        else
            @home = true
        end
    end
end