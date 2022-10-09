class CreateRams < ActiveRecord::Migration[7.0]
  def change
    create_table :rams do |t|
      t.string :brand
      t.string :model
      t.integer :size
      t.string :type
      t.integer :speed
      t.string :dimm_type
      t.string :cas_latency

      t.timestamps
    end
  end
end
