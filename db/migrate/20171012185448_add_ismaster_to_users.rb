class AddIsmasterToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ismaster, :boolean
  end
end
