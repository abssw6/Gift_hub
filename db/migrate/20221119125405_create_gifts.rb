class CreateGifts < ActiveRecord::Migration[7.0]
  def change
    create_table :gifts do |t|
      t.string :name
      t.string :type
      t.float :rrp
      t.text :description
      t.text :link

      t.timestamps
    end
  end
end
