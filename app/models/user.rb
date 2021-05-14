class User < ApplicationRecord
    has_many :games

    validates :username, :email, :password, presence: true
    validates :username, uniqueness: true
    validates :username, length: { minimum: 6 }
    validates :email, uniqueness: true
    validates :password, length: { in: 6..20 }
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end
