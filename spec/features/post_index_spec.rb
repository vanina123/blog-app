RSpec.describe "User Post Index Page", type: :feature do
    before do
      # Manually create sample user with profile picture, username, and posts
      @user = User.create(
        username: "testuser",
        profile_picture_url: "path/to/profile_picture.png",
      )
  
      # Manually create sample posts for the user
      @posts = []
      10.times do |i|
        @posts << @user.posts.create(
          title: "Post #{i+1}",
          body: "This is the body of Post #{i+1}."
        )
      end
  
      visit user_posts_path(@user)
    end
  
    it "displays the user's profile picture" do
      expect(page).to have_selector("img[src*='path/to/profile_picture.png']")
    end
  
    it "displays the user's username" do
      expect(page).to have_content(@user.username)
    end
  
    it "displays the number of posts the user has written" do
      expect(page).to have_content("Number of Posts: 10") # Assuming there are 10 posts in this case
    end
  
    it "displays a post's title" do
      @posts.each do |post|
        expect(page).to have_content(post.title)
      end
    end
  
    it "displays some of the post's body" do
      @posts.each do |post|
        expect(page).to have_content(post.body[0..10]) # Displaying first 11 characters of the post's body
      end
    end
  
    it "displays the first comments on a post" do
      @posts.each do |post|
        comments = post.return_most_comment
        comments.first(3).each do |comment|
          expect(page).to have_content(comment.content)
        end
      end
    end
  
    it "displays how many comments a post has" do
      @posts.each do |post|
        comments_count = post.comments.count
        expect(page).to have_content("Comments: #{comments_count}")
      end
    end
  
    it "displays how many likes a post has" do
      @posts.each do |post|
        likes_count = post.likes.count
        expect(page).to have_content("Likes: #{likes_count}")
      end
    end
  
    it "has a section for pagination if there are more posts than fit on the view" do
      expect(page).to have_selector(".pagination")
    end
  
    it "redirects to a post's show page when clicked on a post" do
      post = @posts.first
      click_link post.title
      expect(page).to have_current_path(post_path(post))
    end
  end