class AddSelectedBidToAnuncis < ActiveRecord::Migration[5.1]
  def change
    add_reference :anuncis, :selectedBid, foreign_key: {to_table: :bids}
  end
end
