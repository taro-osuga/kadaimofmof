class Station < ApplicationRecord
    belongs_to :house, optional: true
end
