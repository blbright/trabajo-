class User < ActiveRecord::Base

groupify :group_member
groupify :named_group_member


 has_many :posts, dependent: :destroy
 has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
