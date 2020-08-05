class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :posts, dependent: :destroy

  validates :username, presence: true
  acts_as_taggable_on :tags # user.tag_list が追加される
  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス
  

end
