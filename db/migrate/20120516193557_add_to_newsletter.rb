class AddToNewsletter < ActiveRecord::Migration
  def self.up
    add_column :newsletters, :from_email, :string, :null => false, :default => ""
    add_column :newsletters, :from_pwd, :string, :null => false, :default => ""
  end

  def self.down
    remove_column :newsletters, :from_email
    remove_column :newsletters, :from_pwd
  end
end
