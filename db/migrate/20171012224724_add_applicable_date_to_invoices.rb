class AddApplicableDateToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :applicable_date, :date
  end
end
