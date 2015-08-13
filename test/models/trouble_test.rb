require 'test_helper'

class TroubleTest < ActiveSupport::TestCase
  def setup
    @u1 = User.create(name: "Haruka Saigusa", screenname: "mopocalypse")
    @u2 = User.create(name: "Daisukenojo Bito", screenname: "ice_in_shibuya")
    @t1 = Trouble.create(name: "Save Us!", description: "We've been trapped in a hotel for two months! None of us know where we are and twelve of us are dead.",
                         trouble_creator_id: @u1.id, trouble_solver_id: @u2.id)
  end

  test "it has a trouble_creator associated with it" do
    assert_equal @u1, @t1.trouble_creator
  end

  test "it has a trouble_solver associated with it" do
    assert_equal @u2, @t1.trouble_solver
  end
end
