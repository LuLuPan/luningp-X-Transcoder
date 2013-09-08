class CreateXCoders < ActiveRecord::Migration
  def change
    create_table :x_coders do |t|
      t.string :stream
      t.string :format
      t.integer :user_id

      t.timestamps
    end
  end
end
