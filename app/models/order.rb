# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  track_no    :string(36)
#  details     :text
#  customer_id :integer
#  employee_id :integer
#  order_date  :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Order < ActiveRecord::Base
  belongs_to :customer, :inverse_of => :orders
  belongs_to :employee

  attr_accessible :track_no
  attr_accessible :details
  attr_accessible :order_date
  attr_accessible :customer_id
  attr_accessible :employee_id
  attr_accessible :product_ids

  has_and_belongs_to_many :products
  #has_many :patients, :through => :appointments


  validate :order_date_is_date?
  validates_presence_of :details

  private

  def order_date_is_date?
    if !order_date.is_a?(Date)
      errors.add(:order_date, 'must be a valid date')
    end
  end

  #validates :order_date, :date => {:after => Date.today, :message => 'must be after today'}, :on => :create
end
