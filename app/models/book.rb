class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end


# ・最大文字数：length: { maximum: 20 }
# ・最小文字数：length: { minimum: 20 }
# ・文字数の範囲：length: { in: 1..30 }
# ・空でない：presence: true
# ・他と被っていない：uniqueness: true
# ・正規表現：format: { with: /<正規表現>/}
# ・「<属性名>_confirmation」と一致：confirmation: true