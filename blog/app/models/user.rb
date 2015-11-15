class User < ActiveRecord::Base
  has_one :profiles

  has_secure_password

  validates_uniqueness_of :email
end
