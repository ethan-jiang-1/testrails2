class CreatePostsPostComments < ActiveRecord::Migration
  def change
    create_table :posts_post_comments do |t|
      t.references :post
      t.references :post_comment

    end
    add_index :posts_post_comments, :post_id
    add_index :posts_post_comments, :post_comment_id
  end
end
