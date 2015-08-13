class AddLocationToTroubles < ActiveRecord::Migration
  def change
    add_column :troubles, :location, :string
  end
end
