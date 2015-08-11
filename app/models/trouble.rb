class Trouble < ActiveRecord::Base
  scope :solved, -> { where(status: "solved") }

  belongs_to :trouble_creator, class_name: "User"
  belongs_to :trouble_solver, class_name: "User"
end
