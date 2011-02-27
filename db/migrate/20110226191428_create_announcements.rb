class CreateAnnouncements < ActiveRecord::Migration
  def self.up
    create_table :announcements do |t|
      t.string :title, :description
      t.integer :type
      t.date :announcementDate

      t.timestamps
    end
  end

  def self.down
    drop_table :announcements
  end
end
