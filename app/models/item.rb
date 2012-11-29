class Item < ActiveRecord::Base
  attr_accessible :creator_id, :name, :url, :user_id, :want, :purchaser_id, :purchased

  scope :want, where(want: true)
  scope :dont, where(want: false)
  scope :mine, where('"items"."user_id" = "items"."creator_id"')
end
