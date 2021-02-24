class User < ApplicationRecord
    validates :name, presence: true, length: { in: 4..64 }

    has_many :tasks
end
