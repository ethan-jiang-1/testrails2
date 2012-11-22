# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  track_no    :string(255)
#  details     :string(255)
#  customer_id :integer
#  order_date  :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Order < ActiveRecord::Base
  belongs_to :customer, :inverse_of => :orders

  attr_accessible :track_no
  attr_accessible :details
  attr_accessible :order_date
  attr_accessible :customer_id

  has_many :products

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
