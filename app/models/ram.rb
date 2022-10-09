class Ram < ApplicationRecord
    validates :brand, presence: true
    validates :model, presence: true
    validates :size, presence: true
    validates :ram_type, presence: true
    validates :speed, presence: true
    validates :dimm_type, presence: true
    validates :cas_latency, presence: true
end
