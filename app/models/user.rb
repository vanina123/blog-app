class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  def return_most_post
    Post.where(author_id: id).order(created_at: :desc).limit(3)
  end
end
