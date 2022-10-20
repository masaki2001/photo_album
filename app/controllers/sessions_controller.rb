class SessionsController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :authenticate?, only: [:destroy]
  before_action :logged_in?, only: [:new, :create]
  def new; end

  def create
    if @user.present? && @user.authenticate(params[:password])
      login(user: @user)
      user_photos_path(current_user)
    else
      failure_messages = []
      failure_messages.push('ユーザーIDを入力してください') if params[:display_id].blank?
      failure_messages.push('パスワードを入力してください') if params[:password].blank?
      flash[:failure] = failure_messages.presence || ['ユーザーIDまたはパスワードが正しくありません']
      redirect_to root_path
    end
  end

  def destroy

  end

  private

  def set_user
    @user = User.find_by(display_id: params[:display_id])
  end

  def logged_in?
    redirect_to user_photos_path(current_user) if current_user.present?
  end
end
