class AddNewsletterSubject < ActiveRecord::Migration
  def self.up
    add_column :newsletters, :subject, :string, :null => false, :default => "Weekly Newsletter" 
  end

  def self.down
    remove_column :newsletters, :subject
  end
end
