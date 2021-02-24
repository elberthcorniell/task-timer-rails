class Task < ApplicationRecord
    validates :name, presence: true, length: { in: 4..64 }
    validates :description, length: { in: 4..128 }

    belongs_to :user
    has_many :timers
end
