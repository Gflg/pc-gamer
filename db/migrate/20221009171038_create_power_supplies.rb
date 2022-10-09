class CreatePowerSupplies < ActiveRecord::Migration[7.0]
  def change
    create_table :power_supplies do |t|
      t.string :brand
      t.string :model
      t.integer :power
      t.string :efficiency
      t.string :color

      t.timestamps
    end
  end
end
