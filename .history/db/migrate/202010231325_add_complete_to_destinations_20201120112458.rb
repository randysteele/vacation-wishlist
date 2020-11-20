class AddCompleteToDestinations < ActiveRecord::Migration
    def change 
      add_column :destination, :complete, :boolean
  end
  end