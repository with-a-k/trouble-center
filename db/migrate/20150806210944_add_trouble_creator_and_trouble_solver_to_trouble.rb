class AddTroubleCreatorAndTroubleSolverToTrouble < ActiveRecord::Migration
  def change
    add_column :troubles, :trouble_creator_id, :integer
    add_column :troubles, :trouble_solver_id, :integer
    remove_column :troubles, :user_id
  end
end
