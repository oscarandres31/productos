class Favorite < ApplicationRecord
  validates :user, uniquenes: { scope: :product }

  belongs_to :user
  belongs_to :product
end
