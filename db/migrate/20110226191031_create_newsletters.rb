class CreateNewsletters < ActiveRecord::Migration
  def self.up
    create_table :newsletters do |t|
      t.string :name, :sendaddress, :template

      t.timestamps
    end
  end

  def self.down
    drop_table :newsletters
  end
end
