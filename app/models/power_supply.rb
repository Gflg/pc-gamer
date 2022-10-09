class PowerSupply < ApplicationRecord
    validates :brand, presence: true
    validates :model, presence: true
    validates :power, presence: true
    validates :efficiency, presence: true
    validates :color, presence: true
end
