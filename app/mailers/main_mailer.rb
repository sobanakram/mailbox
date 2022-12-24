class MainMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.main_mailer.send_custom.subject
  #
  def send_custom(from, to, subject, body)
    @body = body

    mail from: from, to: to, subject: subject
  end
end
