require "test_helper"

class MainMailerTest < ActionMailer::TestCase
  test "send_custom" do
    mail = MainMailer.send_custom
    assert_equal "Send custom", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
