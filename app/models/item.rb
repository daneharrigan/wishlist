class Item < ActiveRecord::Base
  attr_accessible :creator_id, :name, :url, :description, :user_id, :want, :purchaser_id, :purchased

  belongs_to :user
  belongs_to :creator, class_name: "User"
  belongs_to :purchaser, class_name: "User"

  scope :want, where(want: true)
  scope :dont, where(want: false)
  scope :mine, where('"items"."user_id" = "items"."creator_id"')
end
