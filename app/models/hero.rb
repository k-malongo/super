class Hero < ApplicationRecord
  has_many :hero_power
  has_many :powers, through: :hero_power
end
