require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.new(name: 'Tom', photo: 'cat.url', bio: 'New user') }
  let(:post) { Post.new(author: user, title: 'Nature', text: 'I love this!') }
  subject { Like.new(post:, author: user) }
  before { subject.save }

  it 'method update_like_counter' do
    expect { subject.send(:update_like_counter) }.to change { post.reload.likes_counter }.by(1)
  end
end
