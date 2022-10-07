class HeroPower < ApplicationRecord
    validates :strength, inclusion: {in:["Weak", "Average", "Strong"]}
    belongs_to :hero
    belongs_to :power
end
