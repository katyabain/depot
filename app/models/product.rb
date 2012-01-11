# == Schema Information
#
# Table name: products
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  image_url   :string(255)
#  price       :decimal(8, 2)
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ActiveRecord::Base
default_scope :order => 'title'
has_many :line_items
has_many :orders, :through => :line_items
# customize devise order now
# start
# end

before_destroy :ensure_not_referenced_by_any_line_item

validates :title, :description, :image_url, :presence => true
validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
validates :title, :uniqueness => true
validates :image_url, :format => {
  :with    => %r{\.(gif|jpg|png)$}i,
  :message => 'must be URL for GIF,JPEG or PNG image.'
}


private
 #ensure there's no line items referencing this product
 
 def ensure_not_referenced_by_any_line_item
  if line_items.empty?
    return true
 else
    errors.add(:base, 'Line Items present')
    return false
  end
 end

end
