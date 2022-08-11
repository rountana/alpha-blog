class Article < ApplicationRecord
    # note has_many has plural, whereas we use singular "user" for table name, as 
    # an article can only belong to a single user!
    belongs_to :user
    validates :title, presence: true, length: {minimum: 6, maximum: 20}
    validates :description, presence: true, length: {minimum: 10, maximum: 100} 
end