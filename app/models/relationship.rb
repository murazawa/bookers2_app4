class Relationship < ApplicationRecord
  
  belongs_to :follower_id, class_name: "User" # フォローするユーザーfollower_id
  belongs_to :followed_id, class_name: "User" # フォローされるユーザーfollowed_id
  
  
end
# class_name: "User"を定義することでUserテーブルのレコードを参照する
 # フォローするユーザーfollower_id
  # フォローされるユーザーfollowed_id