class BlurbsController < ApplicationController
  before_action :admin_user

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

  def edit
    @blurb = Blurb.find(params[:id])
  end

  def update
    @blurb = Blurb.find(params[:id])
    if @blurb.update_attributes(blurb_params)
      flash[:success] = "Blurb updated"
      redirect_to root_url
    else
      render 'edit'
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

    def admin_user
      unless signed_in?
        store_location
        flash[:warning] = 'Please sign in.'
        redirect_to signin_url
      end
      if signed_in?
        if current_user.admin?
        else
          redirect_to root_url
          flash[:warning] = "You must be an administrator to access this page."
        end
      else
      end
    end
end
