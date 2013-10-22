# == Schema Information
#
# Table name: audits
#
#  id              :integer          not null, primary key
#  auditable_id    :integer
#  auditable_type  :string(255)
#  associated_id   :integer
#  associated_type :string(255)
#  user_id         :integer
#  user_type       :string(255)
#  username        :string(255)
#  action          :string(255)
#  audited_changes :text
#  version         :integer          default(0)
#  comment         :string(255)
#  remote_address  :string(255)
#  created_at      :datetime
#

class Audit < ActiveRecord::Base
  attr_accessible :id
  attr_accessible :auditable_id
  attr_accessible :auditable_type
  attr_accessible :associated_id
  attr_accessible :associated_type
  attr_accessible :user_id
  attr_accessible :user_type
  attr_accessible :username
  attr_accessible :action
  attr_accessible :audited_changes
  attr_accessible :version
  attr_accessible :comment
  attr_accessible :remote_address
  attr_accessible :created_at
end
