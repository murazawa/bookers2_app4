class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :books, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	
	has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
	has_many :followers, through: :reverse_of_relationships, source: :follower
	# 被フォロー関係を通じて参照→followed_idをフォローしている人
	
	has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 【class_name: "Relationship"】は省略可能
 
  has_many :followings, through: :relationships, source: :followed
  # 与フォロー関係を通じて参照→follower_idをフォローしている人
 
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id)
  end
  def following?(user)
    following.include?(user)
  end
 
  attachment :profile_image, destroy: false
  validates :name,  presence: true, length: { in: 2..20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
end
  # フォローするユーザーfollower_id
  # フォローされるユーザーfollowed_id


  # foreign_key（FK）には、@user.xxxとした際に「@user.idがfollower_idなのかfollowed_idなのか」を指定します。
  # has_many :xxx, class_name: "モデル名", foreign_key: "○○_id", dependent: :destroy
  # @user.booksのように、@user.yyyで、
  # そのユーザがフォローしている人orフォローされている人の一覧を出したい
  # has_many :yyy, through: :xxx, source: :zzz
   
# ・最大文字数：length: { maximum: 20 }
# ・最小文字数：length: { minimum: 20 }
# ・文字数の範囲：length: { in: 1..30 }
# ・空でない：presence: true
# ・他と被っていない：uniqueness: true
# ・正規表現：format: { with: /<正規表現>/}
# ・「<属性名>_confirmation」と一致：confirmation: true