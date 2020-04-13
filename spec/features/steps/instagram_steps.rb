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