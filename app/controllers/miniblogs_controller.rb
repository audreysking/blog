class MiniblogsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @blogs = Miniblog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @miniblog = Miniblog.new
  end

  def create
    Miniblog.create(create_params)
    redirect_to action: :index
  end

  def destroy
    miniblog = Miniblog.find(params[:id])
    miniblog.destroy if miniblog.user_id == current_user.id
    redirect_to action: :index
  end

  def edit
    @miniblog = Miniblog.find(params[:id])
  end

  def update
    miniblog = Miniblog.find(params[:id])
    miniblog.update(create_params) if miniblog.user_id == current_user.id
    redirect_to action: :index
  end

  private
  def create_params
    params.require(:miniblog).permit(:text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
