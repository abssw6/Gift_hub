class ChangeDataTypeForFieldname < ActiveRecord::Migration[7.0]
  def change
    rename_column :gifts, :type, :gift_type
  end
end
