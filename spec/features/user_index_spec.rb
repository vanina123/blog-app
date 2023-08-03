# spec/features/user_index_spec.rb
RSpec.describe "User Index Page", type: :feature do
    before do
      # Create sample users with usernames, profile pictures, and post counts
      # Visit the User index page
      visit users_path
    end
  
    it "displays the username of all other users" do
      # Verify that each user's username is present on the page
      User.all.each do |user|
        expect(page).to have_content(user.username)
      end
    end
  
    it "displays the profile picture for each user" do
      # Verify that each user's profile picture is present on the page
      User.all.each do |user|
        expect(page).to have_selector("img[src*='#{user.profile_picture_url}']")
      end
    end
  
    it "displays the number of posts each user has written" do
      # Verify that the number of posts for each user is present on the page
      User.all.each do |user|
        expect(page).to have_content("Posts: #{user.posts.count}")
      end
    end
  
    it "redirects to a user's show page when clicked" do
      # Find the link for a specific user and click on it
      user = User.first
      click_link user.username
  
      # Verify that the browser is redirected to the correct show page
      expect(page).to have_current_path(user_path(user))
    end
  end