class CreateCompleted < ActiveRecord::Migration
  def change
    create_table :completed do |t|
      t.boolean :complete
    end
  end
end
