class Offer < ActiveRecord::Base
  attr_accessible :comment, :name, :price_from_mmc, :price_from_opr, :price_per_night
end
