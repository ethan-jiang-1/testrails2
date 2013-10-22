# == Schema Information
#
# Table name: post_comments
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostComment < ActiveRecord::Base
  attr_accessible :content

  def display_name
  	"#{content}"
  end
end
