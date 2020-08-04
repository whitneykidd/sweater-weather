class Api::V1::UsersController < ApplicationController
  def create
    user = User.create_account(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      error = user.errors.full_messages.to_sentence
      status = error.include?('taken') ? :conflict : :forbidden
      render json: { error: error }, status: status
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
