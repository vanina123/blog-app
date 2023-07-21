require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:author) { User.create(name: 'Tom', photo: 'jobseeker.url', bio: 'Teacher from Cameroon.') }
  let(:post) { Post.new(author:, title: 'Nature', text: 'I love this!') }
  subject { Comment.new(post:, author:, text: 'It is nice') }
  before { subject.save }

  context 'return updated comments counter' do
    it 'increments the post\'s comments_counter on save' do
      expect { subject.save }.to change { post.reload.comments_counter }.by(1)
    end
  end
end
