class Country < ApplicationRecord
  has_many :blogs, dependent: :destroy
  mount_uploaders :images, ImagesUploader
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true
  validates :boundaries, presence: true


end
