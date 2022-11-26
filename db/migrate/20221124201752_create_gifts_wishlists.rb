class CreateGiftsWishlists < ActiveRecord::Migration[7.0]
  def change
    create_table :gifts_wishlists do |t|
      t.references :wishlist, null: false, foreign_key: true
      t.references :gift, null: false, foreign_key: true
      t.timestamps
    end
  end
end
