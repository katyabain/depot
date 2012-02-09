class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :domain_name
      t.integer :user_id

      t.timestamps
    end
  end
end
