class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

 def self.search(search)
    where("content ILIKE ?", "%#{search}%")
 end
end
