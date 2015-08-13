module ApplicationHelper
  def solve_button
    link_to "Solved!", trouble_solve_path(trouble.id, 'Solve'), method: :PATCH, remote: true, class: 'solve success button text-center'
  end

  def present_trouble_by_status(trouble)
    if trouble.status == "open" && current_user.name != "Anonymous" && trouble.trouble_creator != current_user
      accept_button(trouble)
    elsif trouble.status == "accepted" && (trouble.trouble_solver == current_user || trouble.trouble_creator == current_user)
      solve_button(trouble)
    elsif trouble.status == "accepted"
      "Being solved by #{trouble_solver.name}"
    elsif trouble.status == "solved"
      solver_name = trouble.trouble_solver.name if trouble.trouble_solver
      solver_name ||= "an anonymous Troubler"
      "Solved by #{solver_name}"
    end
  end

  private

  def accept_button(trouble)
    link_to "Accept?", trouble_accept_path(trouble.id), method: :PATCH, remote: true, class: 'accept success button text-center'
  end

  def solve_button(trouble)
    link_to "Solved!", trouble_solve_path(trouble.id), method: :PATCH, remote: true, class: 'solve success button text-center'
  end
end
