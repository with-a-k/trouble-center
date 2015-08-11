class TroublesController < ApplicationController
  def create
    Trouble.create(
      trouble_creator: check_user
      name: params[:name]
      description: params[:description]
      skill: params[:skill]
      timeliness: params[:timeliness]
      location: session[:location]
      status: "open"
    )
  end

  def new

  end

  def update

  end

  def solve
    trouble = Trouble.find(params[:id])
    trouble.status = "solved"
    redirect_to :back
  end
end
