class AddPhotoToServicereports < ActiveRecord::Migration[5.1]
  def change
    add_column :servicereports, :photo, :string
  end
end
