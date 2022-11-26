class RenameColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :event_date, :start_time
  end
end
