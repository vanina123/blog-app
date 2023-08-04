class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  after_initialize :set_default_value

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def return_most_post
    Post.where(author_id: id).order(created_at: :desc).limit(3)
  end

  private

  def set_default_value
    self.posts_counter ||= 0
  end
end
