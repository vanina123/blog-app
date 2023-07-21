class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_interger: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_interger: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_counter
  after_initialize :set_default_value

  def return_most_comment
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def set_default_value
    self.likes_counter ||= 0
    self.comments_counter ||= 0
  end

  def posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
