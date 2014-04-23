class Location < ActiveRecord::Base
  has_many :patients

  validates :code, length: { maximum: 10 }
  validates :name, length: { maximum: 80 }

  validates :name, presence: true
end
