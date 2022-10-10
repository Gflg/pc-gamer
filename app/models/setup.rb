class Setup < ApplicationRecord
  belongs_to :processor
  belongs_to :motherboard
  belongs_to :graphics_card
  belongs_to :power_supply
  belongs_to :ram
end
