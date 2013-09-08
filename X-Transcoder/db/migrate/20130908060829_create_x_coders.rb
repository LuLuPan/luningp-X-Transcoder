class CreateXCoders < ActiveRecord::Migration
  def change
    create_table :x_coders do |t|
      t.string :stream
      t.string :format
      t.ineger :user_id

      t.timestamps
    end
  end
end
