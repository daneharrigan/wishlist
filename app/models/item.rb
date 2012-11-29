class Item < ActiveRecord::Base
  attr_accessible :creator_id, :name, :url, :user_id, :want
end
