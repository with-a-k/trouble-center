class TroublesController < ApplicationController
  def create
    Trouble.create(
      trouble_creator: check_user,
      name: params[:trouble][:title],
      description: params[:trouble][:description],
      skill: params[:trouble][:skill],
      timeliness: params[:trouble][:timeliness],
      location: session[:location],
      status: "open"
    )
    redirect_to root_path
  end

  def new

  end

  def update

  end

  def show

  end

  def solve
    trouble = Trouble.find(params[:id])
    trouble.update(status: "solved")
    redirect_to :back
  end

  def assign
    trouble = Trouble.find(params[:id])
    trouble.update(trouble_solver_id: current_user.id, status: "accepted")
    byebug
    redirect_to :back 
  end

  helper_method :check_user

  def check_user
    if current_user
      return current_user
    else
      @current_user = User.create(name: "Anonymous", screenname: "Anonymous")
      session[:user_id] = @current_user.id
      return @current_user
    end
  end
end
