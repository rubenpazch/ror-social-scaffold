class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    timeline_posts
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Naming/VariableName
  def timeline_posts
    @invitations = current_user.invites
    @invitations_accepted = @invitations.where('status > ?', 0).all
    @invitations_accepted.each do |fblock|
      @friendId = fblock.user_id
      @friend = User.find(@friendId)
      @friend_posts_invites ||= @friend.posts.ordered_by_most_recent
    end

    @friendships = current_user.friendships
    @friendships_accepted = @friendships.where('status > ?', 0).all
    @friendships_accepted.each do |fblock|
      @friendId = fblock.friend_id
      @friend = User.find(@friendId)
      @friend_posts_friendships ||= @friend.posts.ordered_by_most_recent
    end

    @timeline_posts ||= current_user.posts.all.ordered_by_most_recent

    if @friend_posts_invites.nil? && @friend_posts_friendships .nil?
      @timeline_posts ||= Post.all.ordered_by_most_recent.includes(:user)
    elsif @friend_posts_invites.nil?
      @timeline_friend_posts ||= @friend_posts_friendships.all.ordered_by_most_recent
    else
      @timeline_friend_posts ||= @friend_posts_invites.all.ordered_by_most_recent
    end
  end

  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Naming/VariableName
  def post_params
    params.require(:post).permit(:content)
  end
end
