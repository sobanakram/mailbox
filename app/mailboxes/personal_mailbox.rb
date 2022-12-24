class PersonalMailbox < ApplicationMailbox

  def process
    address = mail.from.first
    if address.include?(".ru") || address.include?("alek")
      inbound_email.bounced!
      return
    end

    part_to_use = (mail.html_part || mail.text_part || mail)
    encoding = part_to_use.content_type_parameters['charset']
    body = part_to_use.body.decoded
    body = body.force_encoding(encoding) if encoding
    body = body.encode('UTF-8')
    save_email(body)
  end

  def save_email(body)
    email = Email.create(email_params(body))
    mail.attachments.each do |attachment|
      email.attachments.attach(io: File.open(create_temp_file(attachment)),
                               content_type: attachment.content_type,
                               filename: attachment.filename)
    end
  end

  def user
    @user ||= User.find_or_create_dummy(mail.to.first)
  end

  def email_params(body)
    { user: user, subject: mail.subject, content: body,
      # user_name: mail.from_address.name,
      user_email: mail.from.first
    }
  end

  Mail::FromField

  def create_temp_file(attachment)
    temp_file = Tempfile.new(attachment.filename)
    File.open(temp_file.path, 'r+') do |file|
      file.write(attachment.body.decoded.force_encoding('UTF-8'))
    end
    temp_file
  end
end
