class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.datetime :eventdate
      t.string :category
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
