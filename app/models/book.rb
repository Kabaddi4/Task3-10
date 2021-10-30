class Book < ApplicationRecord
  belongs_to :user

  attachment :book_image
end
