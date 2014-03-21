class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.references :user

      t.timestamps
    end
    add_index :lots, :user_id
  end
end
