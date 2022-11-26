class CreateUsercommits < ActiveRecord::Migration[7.0]
  def change
    create_table :usercommits do |t|
      t.references :user, null: false, foreign_key: true
      t.references :wishlist, null: false, foreign_key: true
      t.references :gift, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.boolean :is_commited, default: false

      t.timestamps
    end
  end
end
