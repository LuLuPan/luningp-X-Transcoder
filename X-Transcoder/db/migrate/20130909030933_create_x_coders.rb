class CreateXCoders < ActiveRecord::Migration
  def change
    create_table :xcoders do |t|
      t.string :stream
      t.string :format
      t.integer :user_id

      t.timestamps
    end
    add_index :xcoders, [:user_id, :created_at]
  end
end
