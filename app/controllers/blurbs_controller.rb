class BlurbsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :index]

  def new
    @blurb = Blurb.new
  end

  def create
    @blurb = Blurb.new(blurb_params)
    if @blurb.save
      flash[:success] = "Blurb created"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
    @blurbs = Blurb.all
  end

  def destroy
    Blurb.find(params[:id]).destroy
    flash[:success] = "Blurb destroyed"
    redirect_to root_url
  end

  private

    def blurb_params
      params.require(:blurb).permit!
    end

    def signed_in_user
      unless signed_in?
        store_location
        flash[:warning] = 'Please sign in.'
        redirect_to signin_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || current_user.admin?
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
