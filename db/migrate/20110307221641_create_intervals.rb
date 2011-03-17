class CreateIntervals < ActiveRecord::Migration
  def self.up
    create_table :intervals do |t|
      t.integer :number
      t.integer :length
      t.integer :scale_id

      t.timestamps
    end
  end

  def self.down
    drop_table :intervals
  end
end
