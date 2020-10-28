class Item < ApplicationRecord
    belongs_to :genre, optional: true
    has_many :cart_items
    attachment :image
end
