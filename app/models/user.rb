class User < ApplicationRecord
    # validates if username is present before saving a user object
    # uniqueness is by default case sensitive
    validates :username, presence: true, uniquness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
    #store regular expresssion here. test regex expression at rubular.com 
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniquness: {case_sensitive: false}, 
        length: {maximum: 50},
        format: {with: VALID_EMAIL_REGEX}
end