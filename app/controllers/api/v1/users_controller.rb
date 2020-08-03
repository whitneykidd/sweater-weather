class Api::V1::UsersController < ApplicationController
def create
  user = User.create_account(user_params)
  if user.save
    render json: UserSerializer.new(user), status: :created
  else
    #errors here
  end
end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end