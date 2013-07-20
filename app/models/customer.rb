# == Schema Information
#
# Table name: customers
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  phone           :string(255)
#  phone_mobile    :string(255)
#  mailing_address :string(255)
#  email_address   :string(255)
#  social_info     :string(255)
#  company_id      :integer
#  picture_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Customer < ActiveRecord::Base
  attr_accessible :name, :phone, :phone_mobile, :mailing_address, :email_address, :social_info
  attr_accessible :company_id, :role_ids, :picture_id

  belongs_to :company
  belongs_to :picture
  has_and_belongs_to_many :roles

  has_many :orders, :inverse_of => :customer

  validates_presence_of :name
  validates_uniqueness_of :name
  #validates_format_of :phone, :with => /\(?\b([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})\b/i , :on => :create

end
