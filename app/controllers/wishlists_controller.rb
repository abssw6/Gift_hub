class WishlistsController < ApplicationController
  def show
    @wishlist = Wishlist.find(params[:id])
  end

  def index
    @wishlists = Wishlist.all
  end
end
