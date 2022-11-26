class CreateGiftsWishlist < ActiveRecord::Migration[7.0]
  def change
    create_table :gifts_wishlists do |t|
      t.integer :gift_id
      t.integer :wishlist_id
      t.timestamps
    end
  end
end
