class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(oauth)
      session[:user_id] = user.id
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def finalize
    session[:location] = params[:location]
    redirect_to root_path
  end

  private

  def oauth
    request.env['omniauth.auth']
  end
end
