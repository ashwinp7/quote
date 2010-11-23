class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.integer :year
      t.string :author
      t.string :genre
	  t.string :owner
	  t.integer :like
	  
      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
