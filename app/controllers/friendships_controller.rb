class FriendshipsController < ApplicationController
  def update
    @friend = Friendship.find_by(user_id: current_user)
    @friend.status = friendship_params[:status]

    if @friend.update
      flash[:notice] = 'You send a friendhsip invitation!'
      redirect_to root_path
    else
      flash[:notice] = @friend.errors.full_messages
      redirect_to new_user_path
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
