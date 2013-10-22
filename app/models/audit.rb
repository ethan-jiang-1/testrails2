# == Schema Information
#
# Table name: audits
#
#  id             :integer          not null, primary key
#  auditable_id   :integer
#  auditable_type :string(255)
#  user_id        :integer
#  user_type      :string(255)
#  modifications  :text
#  action         :string(255)
#  tag            :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Audit < ActiveRecord::Base
#=begin  
  attr_accessible :id
  attr_accessible :auditable_id
  attr_accessible :auditable_type
  attr_accessible :user_id
  attr_accessible :user_type
  attr_accessible :action
  attr_accessible :tag
  attr_accessible :created_at
  attr_accessible :updated_at

  before_save :update_mp_user_id
  private 
  def update_mp_user_id
    p "before save called"
    debugger 
    p "before save called"
  end
#=end
end


