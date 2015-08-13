class FrontpageController < ApplicationController
  def index
    @troubles = Trouble.first(45)
  end

  def solving
    @troubles = Trouble.being_solved_by(current_user).first(15)
  end

  def owned
    @troubles = Trouble.owned_by(current_user).first(15)
  end

  def solved
    @troubles = Trouble.solved.first(15)
  end
end
