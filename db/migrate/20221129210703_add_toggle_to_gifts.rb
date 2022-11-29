class AddToggleToGifts < ActiveRecord::Migration[7.0]
  def change
    add_column :gifts, :toggle, :boolean
  end
end
