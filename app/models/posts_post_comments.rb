# == Schema Information
#
# Table name: posts_post_comments
#
#  id              :integer          not null, primary key
#  post_id         :integer
#  post_comment_id :integer
#

class PostsPostComments < ActiveRecord::Base
  belongs_to :post
  belongs_to :post_comment

  attr_accessible :post_id, :post_comment_id
  # attr_accessible :title, :body
end
