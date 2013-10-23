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
  attr_accessible :id

  attr_accessible :auditable_id,:auditable_type
  attr_accessible :user_id, :user_type
  attr_accessible :modifications
  attr_accessible :action
  attr_accessible :tag
end
