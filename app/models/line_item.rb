# == Schema Information
#
# Table name: line_items
#
#  id         :integer         not null, primary key
#  product_id :integer
#  cart_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  quantity   :integer         default(1)
#  order_id   :integer
#

class LineItem < ActiveRecord::Base
 belongs_to :order
 belongs_to :product
 belongs_to :cart
# customize devise
 belongs_to :user
# end

if @product_id == 1
  PERIOD_TYPES = [['1 month(5$)',1],['6 months(30$)',2],['12 months(130$)',3],['24 months(230$)',4]]
elsif @product_id == 2
  PERIOD_TYPES = [['1 month(10$)',1],['6 months(60$)',2],['12 months(160$)',3],['24 months(260$)',4]]
else
  PERIOD_TYPES = [['1 month(15$)',1],['6 months(90$)',2],['12 months(190$)',3],['24 months(290$)',4]]
end

def price
 product.price
end

def total_price
     product.price
end
end
