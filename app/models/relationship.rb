class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User'

  validates :user_id, presence: true
  validates :follow_id, presence: true
end
# ・最大文字数：length: { maximum: 20 }
# ・最小文字数：length: { minimum: 20 }
# ・文字数の範囲：length: { in: 1..30 }
# ・空でない：presence: true
# ・他と被っていない：uniqueness: true
# ・正規表現：format: { with: /<正規表現>/}
# ・「<属性名>_confirmation」と一致：confirmation: true