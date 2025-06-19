class User < ApplicationRecord
    validates :name, :email, :age, presence: true
    validates :email, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
end
