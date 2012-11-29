class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.string :phone_mobile
      t.string :mailing_address
      t.string :email_address
      t.string :social_info
      t.references :company
      t.references :picture

      t.timestamps
    end
    add_index :customers, :company_id
    add_index :customers, :picture_id
  end
end
