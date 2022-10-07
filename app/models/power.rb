class Power < ApplicationRecord
    validates :description, length: {minimum:20}
    has_many :hero_power
    has_many :heroes, through: :hero_power
end
