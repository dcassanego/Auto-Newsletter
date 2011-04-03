class RenameAnnouncementDate < ActiveRecord::Migration
  def self.up
    rename_column :announcements, :announcementDate, :announcementdate
  end

  def self.down
  end
end
