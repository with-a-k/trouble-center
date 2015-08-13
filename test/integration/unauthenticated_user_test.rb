require_relative '../test_helper'

class UnauthenticatedUserTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = TroubleCenter::Application
  end

  def test_unauthenticated_user_can_post_a_trouble
    assert_equal 0, Trouble.count

    visit root_path
    click_link 'I Have a Trouble'

    fill_in :title, with: "Help, I Can't Write Software Tests!"
    fill_in :description, with: "I've been historically bad at it and don't know where to begin."
    select('Computers', :from => :skill)
    choose('Urgent')

    # save_and_open_page
    click_button 'Get Help!'

    assert_equal 1, Trouble.count
    assert_equal "open", Trouble.first.status
    assert_equal "urgent", Trouble.first.timeliness
    assert_equal "Computers", Trouble.first.skill
    assert_equal nil, Trouble.first.trouble_solver
  end
end