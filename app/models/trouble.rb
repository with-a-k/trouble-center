class Trouble < ActiveRecord::Base
  # need to distinguish a trouble's creator from the user that accepts it
  belongs_to :user
end
