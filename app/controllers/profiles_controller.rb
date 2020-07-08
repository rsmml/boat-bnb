class ProfilesController < ApplicationController
  before_action :find_profile_user, only: %i[update edit show]

  def show; end

  def edit; end

  def update
    authorize @user
    if @user.update(profile_user_params)
      redirect_to profile_path(@user)
    else
      render :new
    end
  end

  private

  def find_profile_user
    @user = User.find(current_user.id)
  end

  def profile_user_params
    params.require(:user).permit(:name, :email, :bio, :photo)
  end
end
