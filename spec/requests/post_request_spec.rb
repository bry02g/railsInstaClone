require 'rails_helper'

RSpec.describe "Posts", type: :request do
    fixtures :users, :posts
      before do
        @user = users(:tom)
        @post = posts(:one)
      end
    
     describe "When signed in" do
       before do
          sign_in @user
       end
         
      it "should get index" do
        get user_posts_url(@user)
        assert_response :success
      end

      it "should get new" do
        get new_user_post_url(@user)
        assert_response :success
      end

      it "should create post" do
        expect{
            post user_posts_url(@user), params: { post: { caption: @post.caption, image_url: @post.image_url } }
        }.to change(Post,:count).by 1

        assert_redirected_to user_posts_url(@user)
      end

      it "should show post" do
        get user_post_url(@user, @post)
        assert_response :success
      end

      it "should get edit" do
        get edit_user_post_url(@user,@post)
        assert_response :success
      end

      it "should update post" do
        patch user_post_url(@user, @post), params: { post: { caption: @post.caption, image_url: @post.image_url, } }
        assert_redirected_to user_posts_url(@user)
      end

      it "should destroy post" do
        expect{
          delete user_post_url(@user, @post)
        }.to change(Post,:count).by -1

        assert_redirected_to user_posts_url(@user)
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
        post user_posts_url(@user), params: { post: { caption: @post.caption, image_url: @post.image_url } }
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
        patch user_post_url(@user, @post), params: { post: { caption: @post.caption, image_url: @post.image_url } }
        expect(response).to redirect_to(new_user_session_path)
      end

      it "should not destroy post" do
        delete user_post_url(@user, @post)
        expect(response).to redirect_to(new_user_session_path)
      end

    end
end
