class Country < ApplicationRecord
  has_many :blogs, dependent: :destroy
  belongs_to :user
  validates :bounds, presence: true
  validates :user, presence: true
  validates :name, presence: true
end
