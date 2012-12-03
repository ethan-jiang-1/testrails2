# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :string(255)
#  price      :float
#

class Product < ActiveRecord::Base
  attr_accessible :name, :category, :price
  attr_accessible :picture_ids
  attr_accessible :order_ids

  has_many :pictures, :as => :imageable

  has_and_belongs_to_many :orders


  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
