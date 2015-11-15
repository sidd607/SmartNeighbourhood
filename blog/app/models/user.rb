class User < ActiveRecord::Base
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  has_one :profiles

  has_secure_password

  validates_uniqueness_of :email
end
