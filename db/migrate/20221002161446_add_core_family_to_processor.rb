class AddCoreFamilyToProcessor < ActiveRecord::Migration[7.0]
  def change
    add_column :processors, :core_family, :string
  end
end
