class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :books, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	
	
  attachment :profile_image, destroy: false

  validates :name,  presence: true, length: { in: 2..20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
end

    
# ・最大文字数：length: { maximum: 20 }
# ・最小文字数：length: { minimum: 20 }
# ・文字数の範囲：length: { in: 1..30 }
# ・空でない：presence: true
# ・他と被っていない：uniqueness: true
# ・正規表現：format: { with: /<正規表現>/}
# ・「<属性名>_confirmation」と一致：confirmation: true