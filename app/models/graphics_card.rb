class GraphicsCard < ApplicationRecord
  has_many :setups

  validates :brand, presence: true
  validates :model, presence: true
  validates :memory, presence: true
  validates :memory_interface, presence: true
  validates :length, presence: true
  validates :interface, presence: true
  validates :chipset, presence: true
  validates :base_clock, presence: true
  validates :clock_speed, presence: true
end
