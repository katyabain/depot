# == Schema Information
#
# Table name: orders
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  address    :text
#  email      :string(255)
#  pay_type   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
