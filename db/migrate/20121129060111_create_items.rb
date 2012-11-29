class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :url
      t.string  :name,       :null    => false
      t.integer :user_id,    :null    => false
      t.integer :creator_id, :null    => false
      t.boolean :want,       :default => true
      t.boolean :purchased,  :default => false
      t.integer :purchaser_id

      t.timestamps
    end
  end
end
