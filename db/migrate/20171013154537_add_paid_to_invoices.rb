class AddPaidToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :paid, :boolean
  end
end
