class Company < ActiveRecord::Base
  attr_accessible :location, :name
  has_many :customers
end
