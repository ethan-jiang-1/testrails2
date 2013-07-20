# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :posts_post_comment, :class => 'PostsPostComments' do
    post nil
    post_comment nil
  end
end
