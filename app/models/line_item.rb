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
PERIOD_TYPES = ['1 month(5$)','6 months(30$)','12 months(130$)','24 months(230$)']
elsif @product_id == 2
  PERIOD_TYPES = ['1 month(10$)','6 months(60$)','12 months(160$)','24 months(260$)']
else
  PERIOD_TYPES = ['1 month(15$)','6 months(90$)','12 months(190$)','24 months(290$)']
end

def total_price
  product.price*quantity
end
end
