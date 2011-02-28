class AddDetailFieldsToAnnouncement < ActiveRecord::Migration
  def self.up
    change_table :announcements do |t|
      t.string :contact, :time, :location
    end
  end

  def self.down
    remove_column :announcements, :contact
    remove_column :announcements, :time
    remove_column :announcements, :location
  end
end
