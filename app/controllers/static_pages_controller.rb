class StaticPagesController < ApplicationController
  before_action :admin_user, only: [:admin]

  def home
    @blurbs = Blurb.all
    @stores = Store.all
  end

  def about
  end

  def services
  end

  def admin
    @blurbs = Blurb.all
    @stores = Store.all
  end

  def locations
    @stores = Store.all
  end

  def index
    params[:email] ||= 'barnespeter213@gmail.com'
  end

  def sendit
    if UserMailer.email(params).deliver
      flash[:success] = "Your message has been sent"
    else
      flash[:error] = "Something went wrong"
    end
      redirect_to contact_path
  end

  private 

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
