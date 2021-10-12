class CreateFbMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :fb_messages do |t|
      t.string :received
      t.string :reply

      t.timestamps
    end
  end
end
