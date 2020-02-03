class CreateDestination < ActiveRecord::Migration
  def change 
    create_table do |t|
      t.string :city 
      t.string :state
      t.integer :distance 
      t.string :top_attraction
    end
end
end
