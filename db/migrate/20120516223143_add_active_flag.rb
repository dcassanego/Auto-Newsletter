class AddActiveFlag < ActiveRecord::Migration
  def self.up
    add_column :newsletters, :active, :boolean, :null => false, :default => true
  end

  def self.down
    remove_column :newsletters, :active
  end
end
