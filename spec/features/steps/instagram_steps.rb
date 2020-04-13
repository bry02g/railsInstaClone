step "there are two users with posts, Bob and Mary" do
    @bob = create(:user_with_posts)
    @mary = create(:user_with_posts)
end

step "I sign in as Bob" do
    visit new_user_session_path
    fill_in "user_email", with: @bob.email
    fill_in "user_password", with: "123greetings"
    click_on "Log in"
end

step "I visit the homepage" do
    visit root_path
end

step "I should see the everyone's posts" do
    @posts = Post.all
    @posts.each do |p|
        expect(page.body).to include(p.image_url)
    end
end

step "everyone's posts should be in reverse order" do
    @posts.reverse.each_with_index do |p,i|
        image = find(".order-#{i}")
        expect(image[:class]).to include("post-#{p.id}")
    end
end

step "on the homepage" do
    visit root_path
end

step "I click :text" do |text|
    click_on text
end

step "I should see my profile" do
    expect(page).to have_current_path(user_posts_path(@bob))
end

step "I am viewing the timeline" do
    visit root_path
end

step "I click someones username" do
    id = @mary.posts.first.id
    click_on "post-email-#{id}"
end

step "I should see their profile" do
    expect(page).to have_current_path(user_posts_path(@mary))
end

step "I view Mary's profile" do
    visit user_posts_path(@mary)
end

step "I should see her email address" do
    expect(page).to have_css("#user_email")
end

step "I should see her posts" do
    @mary.posts.each do |p|
        expect(page.body).to include(p.image_url)
    end
end

step "the posts should be in reverse order" do
    @mary.posts.reverse.each_with_index do |p,i|
        image = find(".order-#{i}")
        expect(image[:class]).to include("post-#{p.id}")
    end
end

step "fill out the form and submit" do
    fill_in "post_caption", with: "Cool post"
    fill_in "post_image_url", with: "http://www.google.com/cool.jpg"
    click_on "Create Post"
end

step "I should have created a post" do
    expect(page).to have_content("Post was successfully created.")
end

step "I am viewing one of my posts" do
    visit(user_post_path(@bob, @bob.posts.first))
end

step "fill out the form with a new caption" do
    fill_in "post_caption", with: "New Caption"
end

step "I submit the form" do
    click_on "Update Post"
end

step "the post's caption should have changed" do
    expect(page).to have_content("Post was successfully updated.")
    expect(page).to have_content("New Caption")
end

step "fill out the form with a new image url" do
    fill_in "post_image_url", with: "http://www.aol.com/new.jpg"
end

step "the post's image should have changed" do
    expect(page).to have_content("Post was successfully updated.")
    expect(page.body).to include("http://www.aol.com/new.jpg")
end

step 'I click "Destroy" and confirm' do
    accept_confirm do
        click_on 'Destroy'
    end
end

step "that post should be deleted" do
    expect(page).to have_content("Post was successfully destroyed.")
end