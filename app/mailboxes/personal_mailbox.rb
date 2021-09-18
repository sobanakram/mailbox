class PersonalMailbox < ApplicationMailbox

  def process
    if mail.from_address.address.include?(".ru") || mail.from_address.name.downcase.include?("alek")
      inbound_email.bounced!
      return
    end

    part_to_use = (mail.html_part || mail.text_part || mail)
    encoding = part_to_use.content_type_parameters['charset']
    body = part_to_use.body.decoded.force_encoding(encoding).encode('UTF-8')
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
    @user ||= User.find_or_create_dummy(mail.to_addresses.first.address,
                                        mail.to_addresses.first.name)
  end

  def email_params(body)
    { user: user, subject: mail.subject, content: body,
      user_name: mail.from_address.name,
      user_email: mail.from_address.address
    }
  end

  def create_temp_file(attachment)
    temp_file = Tempfile.new(attachment.filename)
    File.open(temp_file.path, 'r+') do |file|
      file.write(attachment.body.decoded.force_encoding('UTF-8'))
    end
    temp_file
  end
end
