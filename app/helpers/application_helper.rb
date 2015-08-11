module ApplicationHelper
  def solve_button
    link_to "Solved!", trouble_solve_path(trouble.id, 'Solve'), method: :PATCH, remote: true, class: 'solve success button text-center'
  end

  def check_user
    if current_user
      return current_user
    else
      return User.create(name: "Anonymous", screenname: "Anonymous")
    end
  end
end
