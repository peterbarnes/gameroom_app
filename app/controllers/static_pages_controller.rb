class StaticPagesController < ApplicationController
  before_action :admin_user, only: [:admin]

  def home
  end

  def about
  end

  def services
  end

  def admin
  end

  def locations
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
end
