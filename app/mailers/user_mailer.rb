class UserMailer < ActionMailer::Base
  default from: "barnespeter213@gmail.com"

  def email(params)
    @params = params
    mail(to: "barnespeter213@gmail.com", subject: "#{@params[:name]} submitted a comment")
  end
end
