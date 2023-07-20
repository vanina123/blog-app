class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  def post_counter
    author.update(posts_counter: author.posts.count)
  end

  def return_most_comment
    comments.order(created_at: :desc).limit(5)
  end
end

# first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
# second_post = Post.create(author: second_user, title: 'Hello', text: 'This is my second post')
# third_post = Post.create(author: first_user, title: 'Hello', text: 'This is my third post')
# fourth_post = Post.create(author: first_user, title: 'Hello', text: 'This is my fourth post')

# User.most_recent_post

# User.find_by(name: 'Tom')
# User.update(name: 'Nana')
