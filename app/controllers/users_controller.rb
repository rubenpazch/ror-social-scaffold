class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @friend = Friendship.new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    @friend = Friendship.new
  end

  # rubocop: disable Layout/LineLength
  def addfriend
    @friend = Friendship.new(friendship_params)
    if Friendship.find_by(user_id: params[:user_id]).present? && Friendship.find_by(friend_id: params[:user_id]).present?
      flash[:notice] = 'YOU ALREADY HAVE A PENDING INVITATION!'
      redirect_to root_path
    elsif @friend.save
      flash[:notice] = 'You send a friendhsip invitation!'
      redirect_to root_path
    else
      flash[:notice] = @friend.errors.full_messages
      redirect_to users_path
    end
  end
  # rubocop: enable Layout/LineLength

  private

  def friendship_params
    params.permit(:user_id, :friend_id, :status)
  end
end
