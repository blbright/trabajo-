class User < ActiveRecord::Base

groupify :group_member
groupify :named_group_member

has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", square: '200x200#' }, default_url: "http://www.accountingweb.com/sites/all/themes/pp/img/default-user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

 has_many :posts, dependent: :destroy
 has_many :votes
 has_many :comments, through: :posts
 has_many :vote_posts, through: :votes, source: :post

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

end

 
