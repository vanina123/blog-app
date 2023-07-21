require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'jobseeker.url', bio: 'Good', posts_counter: 0) }

  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'confirms posts_counter is greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'expects posts_counter to be an integer' do
    subject.posts_counter = 'one'
    expect(subject).to_not be_valid
  end

  it 'method return_most_post' do
    # Create some posts for the user
    user = User.new(name: 'Tom', photo: 'jobseeker.url', bio: 'Good', posts_counter: 0)
    user.save
    user.posts.create(title: 'Post 1', text: 'This is post 1.')
    user.posts.create(title: 'Post 2', text: 'This is post 2.')
    user.posts.create(title: 'Post 3', text: 'This is post 3.')

    # Call the instance method return_most_post on the user object
    most_posts = user.return_most_post

    # Test the length of the most_posts array (should be <= 3)
    expect(most_posts.length).to be <= 3
  end
end
