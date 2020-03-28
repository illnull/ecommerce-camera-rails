class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :phoneNumber
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
