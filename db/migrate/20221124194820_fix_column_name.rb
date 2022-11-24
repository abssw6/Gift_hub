class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :eventdate, :event_date
  end
end
