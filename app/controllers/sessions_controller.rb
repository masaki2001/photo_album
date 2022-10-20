class SessionsController < ApplicationController
  before_action :set_user, only: [:create]
  def new; end

  def create
    if @user.present? && @user.authenticate(params[:password])
      session[:user] = @user
      # TODO: 画面遷移
    else
      failure_messages = []
      failure_messages.push('ユーザーIDを入力してください') if params[:display_id].blank?
      failure_messages.push('パスワードを入力してください') if params[:password].blank?
      flash.now[:failure] = failure_messages.presence || ['ユーザーIDまたはパスワードが正しくありません']
      render :new
    end
  end

  def destroy

  end

  private

  def set_user
    @user = User.find_by(display_id: params[:display_id])
  end
end
