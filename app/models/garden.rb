class Garden < ApplicationRecord
    has_many :user
    has_many :water_reading
    has_many :light_reading
end
