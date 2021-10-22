class MeetingMailerPreview < ActionMailer::Preview
  def meeting_mail
    MeetingMailer.with(meeting: Meeting.first, user: User.first).meeting_mail
  end
end
