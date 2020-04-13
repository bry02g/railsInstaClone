require 'rails_helper'

RSpec.describe "Posts", type: :request do
      before do
        @user = create(:user_with_posts)
        @post = @user.posts.first
      end
    
     describe "When signed in" do
       before do
          sign_in @user
       end
         
      it "should get index" do
        get user_posts_url(@user)
        expect(response).to have_http_status(:ok)
      end

      it "should get new" do
        get new_user_post_url(@user)
        expect(response).to have_http_status(:ok)
      end

      it "should create post" do
        expect{
            post user_posts_url(@user), params: { post: { caption: "cool post", image_url: "http://aol.com/dog.jpg" } }
        }.to change(Post,:count).by 1

        expect(response).to redirect_to(user_posts_url(@user))
      end

      it "should show post" do
        get user_post_url(@user, @post)
        expect(response).to have_http_status(:ok)
      end

      it "should get edit" do
        get edit_user_post_url(@user,@post)
        expect(response).to have_http_status(:ok)
      end

      it "should update post" do
        patch user_post_url(@user, @post), params: { post: { caption: "edited", image_url: "http://aol.com/cat.jpg", } }
        expect(response).to redirect_to(user_posts_url(@user))
      end

      it "should destroy post" do
        expect{
          delete user_post_url(@user, @post)
        }.to change(Post,:count).by -1

        expect(response).to redirect_to(user_posts_url(@user))
      end
    end

    describe "when not signed in" do
      it "should not get index" do
        get user_posts_url(@user)
        expect(response).to redirect_to(new_user_session_path)
      end

      it "should not get new" do
        get new_user_post_url(@user)
        expect(response).to redirect_to(new_user_session_path)
      end

      it "should not create post" do
        post user_posts_url(@user), params: { post: { caption: "cool post", image_url: "http://aol.com/dog.jpg" } }
        expect(response).to redirect_to(new_user_session_path)
      end

      it "should not show post" do
        get user_post_url(@user, @post)
        expect(response).to redirect_to(new_user_session_path)
      end

      it "should not get edit" do
        get edit_user_post_url(@user, @post)
        expect(response).to redirect_to(new_user_session_path)
      end

      it "should not update post" do
        patch user_post_url(@user, @post), params: { post: { caption: "edited", image_url: "http://aol.com/cat.jpg" } }
        expect(response).to redirect_to(new_user_session_path)
      end

      it "should not destroy post" do
        delete user_post_url(@user, @post)
        expect(response).to redirect_to(new_user_session_path)
      end

    end
end
