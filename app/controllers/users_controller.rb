class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def addfriend
      @friend = Friendship.new(friendship_params)

    if @friend.save
      flash[:notice] = 'You send a friendhsip invitation!'
      redirect_to root_path
    else
      flash[:notice] = @friend.errors.full_messages
      redirect_to new_user_path
    end
  end

  private

  def friendship_params
    params.permit(:user_id, :friend_id, :status)
  end
end
