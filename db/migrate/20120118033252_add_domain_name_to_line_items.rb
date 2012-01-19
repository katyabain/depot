class AddDomainNameToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :domain_name, :string
  end
end
