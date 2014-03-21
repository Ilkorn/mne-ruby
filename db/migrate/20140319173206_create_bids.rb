class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :user
      t.references :lot

      t.timestamps
    end
    add_index :bids, :user_id
    add_index :bids, :lot_id
  end
end
