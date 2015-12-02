class Profile < ActiveRecord::Base
  belongs_to :users
  has_many :posts
  has_surveys

end
