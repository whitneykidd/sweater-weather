class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: session_params[:email])
    if user.present? && user.authenticate(session_params[:password])
      render json: UserSerializer.new(user)
    else
      error_render
    end
  end


  private

  def error_render
    error = 'Incorrect email/password combination'
    render json: { error: error }, status: :unauthorized
  end

  def session_params
    params.permit(:email, :password)
  end
end