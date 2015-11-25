class Yellowpage < ActiveRecord::Base
  validates :name, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :description, presence: true

end
