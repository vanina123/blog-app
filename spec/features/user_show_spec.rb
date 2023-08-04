RSpec.describe 'User Show Page', type: :feature do
  before do
    # Manually create sample user with profile picture, username, posts, and bio
    #   @user = User.create(
    #     username: "testuser",
    #     profile_picture_url: "path/to/profile_picture.png",
    #     bio: "This is a test user's bio."
    # Manually create sample posts for the user
    #   @posts = []
    #   5.times do |i|
    #     @posts << @user.posts.create(
    #       title: "Post #{i+1}",
    #       content: "This is the content of Post #{i+1}."
    #     )
    #   end

    #   visit user_path(@user)
  end

  it "displays the user's profile picture" do
    #   expect(page).to have_selector("img[src*='path/to/profile_picture.png']")
  end

  it "displays the user's username" do
    #   expect(page).to have_content(@user.username)
  end

  it 'displays the number of posts the user has written' do
    #   expect(page).to have_content("Number of Posts: 5") # Assuming there are 5 posts in this case
  end

  it "displays the user's bio" do
    #   expect(page).to have_content(@user.bio)
  end

  it "displays the user's first 3 posts" do
    #   @posts.first(3).each do |post|
    #     expect(page).to have_content(post.title)
    #   end
  end

  it "has a button to view all of a user's posts" do
    #   expect(page).to have_link("View all posts", href: user_posts_path(@user))
  end

  it "redirects to a post's show page when clicked on a user's post" do
    #   post = @posts.first
    #   click_link post.title
    #   expect(page).to have_current_path(post_path(post))
  end

  it "redirects to the user's posts index page when 'View all posts' is clicked" do
    #   click_link "View all posts"
    #   expect(page).to have_current_path(user_posts_path(@user))
  end
end
