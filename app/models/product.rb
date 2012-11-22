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
  has_many:pictures, :as => :imageable
  attr_accessible :name, :category, :price


  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
