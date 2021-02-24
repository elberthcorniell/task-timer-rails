class User < ApplicationRecord
    validates :username, presence: true, length: { in: 4..64 }, uniqueness: true
    has_many :tasks
end
