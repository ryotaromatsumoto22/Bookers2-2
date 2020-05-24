class Book < ApplicationRecord

	belongs_to :user, optional: true

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 50}

end