class Book < ApplicationRecord
  belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

	scope :created_today, -> { where(created_at: Time.current.all_day) } # 今日
	scope :created_yesterday, -> { where(created_at: Time.zone.yesterday.all_day) } # 昨日

	scope :created_this_week, -> { where(created_at: Time.current.all_week) } # 今週
	scope :created_last_week_ago, -> { where(created_at: Time.current.last_week.all_week) } # 先週　
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
