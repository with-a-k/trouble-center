require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @u1 = User.create(name: "Mononobe no Futo", screenname: "queendoms")
    @u2 = User.create(name: "Kotomine Kirei", screenname: "blackmass")
    @t1 = Trouble.create(name: "Save Us!", description: "We've been trapped in a hotel for two months! None of us know where we are and twelve of us are dead.",
                         trouble_creator_id: @u1.id, trouble_solver_id: @u2.id)
  end

  test "it has own_troubles associated with it" do
    assert @u1.own_troubles.include?(@t1)
  end

  test "it has helping_troubles associated with it" do
    assert @u2.helping_troubles.include?(@t1)
  end
end
