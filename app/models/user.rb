class User < ApplicationRecord
    validates :name, :email, :age, presence: true
    validates :email, uniqueness: true
    validates :age, numericality: {
        greater_than: 18,
        less_than: 65,
        only_integer: true
    }
end
