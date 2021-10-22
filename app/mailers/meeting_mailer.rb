class MeetingMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)

  default from: "penya@testing.com"

  def meeting_mail
    @meeting = params[:meeting]
    @user = params[:user]

    mail(to: @user.email, subject: "Hello! This is a meeting confirmation")
  end
end
