class RenameRamColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :rams, :type, :ram_type
  end
end
