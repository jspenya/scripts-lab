class AddCommentableToComments < ActiveRecord::Migration[6.0]
  def up
    add_column :comments, :commentable_type, :string
    add_column :comments, :commentable_id, :integer
  end

  def down
  end
end
