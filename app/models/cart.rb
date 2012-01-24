# == Schema Information
#
# Table name: carts
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
# customize devise
belongs_to :user
# end


    def add_product(product_id)
        current_item = line_items.find_by_product_id(product_id)
            if current_item
                    current_item.quantity += 1
                        else
                                current_item = line_items.build(:product_id => product_id)
                                    end
                                        current_item
                                          end


    def total_price
     line_items.to_a.sum do |item|
       if item.domain == "new"
          item.total_price+10
       else item.total_price 
       end
      end
    end

    def total_items
      line_items.sum(:quantity)
    end
                                          end


