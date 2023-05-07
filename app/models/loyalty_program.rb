class LoyaltyProgram < ApplicationRecord
  def loyalty_name
    name + " " + bonus_count.to_s
  end
end
