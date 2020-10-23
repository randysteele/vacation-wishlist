class DropCompleted < ActiveRecord::Migration
  def change
    drop_table :completed do |t|
      t.boolean :complete
    end
  end
end
