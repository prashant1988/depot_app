class Product < ActiveRecord::Base
  attr_accessible :describe, :image_url, :price, :title
end
