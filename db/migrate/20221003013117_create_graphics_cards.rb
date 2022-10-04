class CreateGraphicsCards < ActiveRecord::Migration[7.0]
  def change
    create_table :graphics_cards do |t|
      t.string :brand
      t.string :model
      t.integer :memory
      t.string :memory_interface
      t.float :length
      t.string :interface
      t.string :chipset
      t.integer :base_clock
      t.integer :clock_speed
      t.string :frame_sync

      t.timestamps
    end
  end
end
