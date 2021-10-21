class RemoveMeetingIdFromComments < ActiveRecord::Migration[6.0]
  def up
    remove_column :comments, :meeting_id
  end

  def down
  end
end
