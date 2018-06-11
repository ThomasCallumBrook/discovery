class Country < ApplicationRecord
  has_many :blogs
  belongs_to :user
end
