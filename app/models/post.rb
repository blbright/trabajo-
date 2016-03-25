class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes

def self.search(search)
  where("content ILIKE ?", "%#{search}%")
end

def votes_count
  self.votes.count
end

end
