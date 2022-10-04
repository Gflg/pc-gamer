class Motherboard < ApplicationRecord
  validates :brand, presence: true
  validates :model, presence: true
  validates :chipset, presence: true
  validates :form_factor, presence: true
  validates :socket_type, presence: true
  validates :memory_slots, presence: true
  validates :max_memory_support, presence: true
end
