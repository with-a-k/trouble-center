class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(oauth)
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def oauth
    request.env['omniauth.auth']
  end
end
