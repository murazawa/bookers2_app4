class Book < ApplicationRecord
  belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } # 今日
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } # 前日
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) } #今週
  scope :created_lastweek, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) } # 前週

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
#間違い
 # scope :created_today, -> { where(created_at: Time.zone.now.all_day) } # 今日
 # scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } # 前日
 # scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) } #今週
 # scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) } # 前週

#正解
	# scope :created_today, -> { where(created_at: Time.current.all_day) } # 今日
	# scope :created_yesterday, -> { where(created_at: Time.zone.yesterday.all_day) } # 昨日
	# scope :created_this_week, -> { where(created_at: Time.current.all_week) } # 今週
	# scope :created_last_week_ago, -> { where(created_at: Time.current.last_week.all_week) } # 先週