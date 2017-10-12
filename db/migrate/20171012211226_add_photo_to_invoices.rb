class AddPhotoToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :photo, :string
  end
end
