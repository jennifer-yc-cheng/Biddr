class AddIsBiddedToAuctions < ActiveRecord::Migration[5.1]
  def change
    add_column :auctions, :is_bidded, :boolean, default: false
  end
end
