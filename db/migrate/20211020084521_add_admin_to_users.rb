class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :admin, :boolean
  end
  
  def down
  end
end
