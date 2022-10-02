class CreateProcessors < ActiveRecord::Migration[7.0]
  def change
    create_table :processors do |t|
      t.string :brand
      t.string :model
      t.integer :cores
      t.integer :threads
      t.string :socket_type
      t.string :string
      t.float :base_speed
      t.float :turbo_speed
      t.string :architechture
      t.string :integrated_graphics
      t.string :memory_type
      t.integer :memory_frequency
      t.string :series
      t.string :generation

      t.timestamps
    end
  end
end
