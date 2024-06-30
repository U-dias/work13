class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def dashboard
    # ユーザーがホストの場合、ホストに対するすべてのゲストレビューを表示
    @guest_reviews = Review.where(type: "GuestReview", host_id: current_user.id)
    # ユーザーがゲストの場合、ユーザに対するすべてのホストレビューを表示
    @host_reviews = Review.where(type: "HostReview", guest_id: current_user.id)
  end
  def update
    @user = current_user
     if @user.update!(current_user_params)
      flash[:notice] = "保存しました"
     else
      flash[:alert] = "更新できません"
     end
     redirect_to dashboard_path
  end
  def show
    @user = User.find(params[:id])
    # ユーザーがホストの場合、ホストに対するすべてのゲストレビューを表示
    @guest_reviews = Review.where(type: "GuestReview", host_id: @user.id)
    # ユーザーがゲストの場合、ユーザに対するすべてのホストレビューを表示
    @host_reviews = Review.where(type: "HostReview", guest_id: @user.id)
  end
  

  private
  def current_user_params
    params.require(:user).permit(:self, :status, :photo, :full_name)
  end
end