class Blog < ApplicationRecord
  belongs_to :country
  validates :country, presence: true
  validates :title, presence: true
  validates :post, presence: true
end
