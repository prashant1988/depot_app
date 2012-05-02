require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  Product.new(:title  =>"My book title"  ,
  :describe     => "yyy" ,
  :price         => 1,
  :image_url      => image_url )
end
test "product is not valid without a unique title -i18n" do
product = Product.new(:title           => products(:ruby).title,
                  :describe       =>   "yyy" ,
                  :price          => 1,
                  :image_url            => "fred.gif" )

assert !product.save
assert_equal "has already been taken" , product.errors[:title].join('; ' )
end


test "image_url"  do
      ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
                    http://a.b.c/x/y/z/fred.gif }
      bad = %w{ fred.doc fred.gif/more fred.gif.more }
      ok.each do |name|
        assert new_product(name).valid?, "#{name} shouldn't be invalid"
      end
      bad.each do |name|
        assert new_product(name).invalid?, "#{name} shouldn't be valid"
      end
    end

