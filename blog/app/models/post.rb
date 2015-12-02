class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :profiles
  acts_as_taggable
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
