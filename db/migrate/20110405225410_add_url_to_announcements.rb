class AddUrlToAnnouncements < ActiveRecord::Migration
  def self.up
    add_column :announcements, :url, :string
  end

  def self.down
    remove_column :announcements, :url
  end
end
