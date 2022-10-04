class CreateMotherboards < ActiveRecord::Migration[7.0]
  def change
    create_table :motherboards do |t|
      t.string :brand
      t.string :model
      t.string :chipset
      t.string :form_factor
      t.string :socket_type
      t.integer :memory_slots
      t.integer :max_memory_support

      t.timestamps
    end
  end
end
