class AddDomainToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :domain, :string
  end
end
