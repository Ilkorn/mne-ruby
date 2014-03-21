class AddSumToBids < ActiveRecord::Migration
  def change
    add_column :bids, :sum, :integer
  end
end
