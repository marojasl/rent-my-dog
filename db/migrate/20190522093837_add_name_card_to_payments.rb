class AddNameCardToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :name_card, :string
    add_column :payments, :cc_number, :integer
    add_column :payments, :expiry_date, :date
    add_column :payments, :cvc, :integer
    add_column :payments, :address_card, :text
  end
end
