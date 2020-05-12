class FriendshipsController < ApplicationController
  def accept
    @friend = Friendship.find_by(user_id: params[:user_id])

    if @friend.update(status: params[:status])
      flash[:notice] = 'You accept a friendhsip invitation!'
      redirect_to users_path
    else
      flash[:notice] = @friend.errors.full_messages
      redirect_to new_user_registration_path
    end
  end

  def reject
    @friend = Friendship.find_by(user_id: params[:user_id])

    if @friend.destroy
      flash[:notice] = 'You reject a friendhsip invitation!'
      redirect_to users_path
    else
      flash[:notice] = @friend.errors.full_messages
      redirect_to new_user_registration_path
    end
  end

  def new
    @friend = Friendship.new
  end

  private

  def friendship_params
    params.permit(:user_id, :friend_id, :status)
  end
end
