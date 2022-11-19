class AddCalendarToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :name, :string
    add_column :events, :start_time, :datetime
  end
end
