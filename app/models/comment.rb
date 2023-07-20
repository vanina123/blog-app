class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  def update_comment_counter
    post.increment!(:comments_counter)
  end
end
# User.update_post_counter
# Class.Thenameofthemethod  6
# Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Hi Tom!' )
# Comment.create(post_id: second_post.id, author_id: second_user.id, text: 'Hi Lilly!' )
# Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Hi Tom!' )
# Comment.create(post_id: third_post.id, author_id: second_user.id, text: 'Hi Vanina!' )
# Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Hi Lari!' )
# Comment.create(post_id: second_post.id, author_id: second_user.id, text: 'Hi Tom!' )
