class Wishlist < ActiveRecord::Migration[7.0]
  def change
    remove_reference :wishlists, :gift, index: true, foreign_key: true
  end
end
