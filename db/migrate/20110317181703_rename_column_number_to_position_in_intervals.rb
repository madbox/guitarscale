class RenameColumnNumberToPositionInIntervals < ActiveRecord::Migration
  def self.up
    change_table :intervals do |t|
      t.rename :number, :position
    end
  end

  def self.down
    change_table :intervals do |t|
      t.rename :position, :number
    end
  end
end
