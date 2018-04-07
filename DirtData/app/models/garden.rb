class Garden < ApplicationRecord
    has_many :user
    has_many :water_reading
end
