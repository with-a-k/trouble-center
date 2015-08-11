class AddSkillAndTimelinessAndStatusToTrouble < ActiveRecord::Migration
  def change
    add_column :troubles, :skill, :string
    add_column :troubles, :timeliness, :string
    add_column :troubles, :status, :string
  end
end
