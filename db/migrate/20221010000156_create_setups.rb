class CreateSetups < ActiveRecord::Migration[7.0]
  def change
    create_table :setups do |t|
      t.string :name
      t.references :processor, null: false, foreign_key: true
      t.references :motherboard, null: false, foreign_key: true
      t.references :graphics_card, null: false, foreign_key: true
      t.references :power_supply, null: false, foreign_key: true
      t.references :ram, null: false, foreign_key: true

      t.timestamps
    end
  end
end
