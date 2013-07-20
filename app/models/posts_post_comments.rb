class PostsPostComments < ActiveRecord::Base
  belongs_to :post
  belongs_to :post_comment

  attr_accessible :post_id, :post_comment_id
  # attr_accessible :title, :body
end
