class Processor < ApplicationRecord
  validates :brand, presence: true
  validates :model, presence: true
  validates :cores, presence: true
  validates :threads, presence: true
  validates :socket_type, presence: true
  validates :base_speed, presence: true
  validates :turbo_speed, presence: true
  validates :architechture, presence: true
  validates :core_family, presence: true
  validates :memory_type, presence: true
  validates :memory_frequency, presence: true
  validates :series, presence: true
  validates :generation, presence: true
end
