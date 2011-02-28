class AddRelationships < ActiveRecord::Migration
  def self.up
    change_table :newsletters do |t|
      t.references :organization
    end
    
    change_table :announcements do |t|
      t.references :newsletter
    end
  end

  def self.down
    remove_column :newsletters, :organization
    remove_column :announcements, :newsletter
  end
end
