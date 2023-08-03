RSpec.describe "Post Show Page", type: :feature do
    before do
      # Manually create a sample user with a post and comments
      @user = User.create(
        username: "testuser",
        profile_picture_url: "path/to/profile_picture.png",
      )
      @post = @user.posts.create(
        title: "Test Post",
        text: "This is the content of the test post.",
      )
      @comments = []
      5.times do |i|
        @comments << @post.comments.create(
          content: "Comment #{i+1} on the test post.",
          user: @user
        )
      end
  
      visit post_path(@post)
    end
  
    it "displays the post's title" do
      expect(page).to have_content(@post.title)
    end
  
    it "displays who wrote the post" do
      expect(page).to have_content("by #{@user.name}")
    end
  
    it "displays how many comments the post has" do
      expect(page).to have_content("Comments: 5") # Assuming there are 5 comments in this case
    end
  
    it "displays how many likes the post has" do
      expect(page).to have_content("Likes: 0") # Assuming there are 0 likes in this case
    end
  
    it "displays the post body" do
      expect(page).to have_content(@post.text)
    end
  
    it "displays the username of each commenter" do
      @comments.each do |comment|
        expect(page).to have_content(comment.user.username)
      end
    end
  
    it "displays the comment left by each commenter" do
      @comments.each do |comment|
        expect(page).to have_content(comment.content)
      end
    end
  end