class Trouble < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  scope :solved,          -> { where(status: "solved") }
  scope :open,            -> { where(status: "open") }
  scope :owned_by,        ->(user) { where(trouble_creator: user) }
  scope :being_solved_by, ->(user) { where(trouble_solver: user) }

  belongs_to :trouble_creator, class_name: "User"
  belongs_to :trouble_solver, class_name: "User"

  validates :name, presence: true
end
