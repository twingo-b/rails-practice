class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAIL_FROM'] || "noreply@example.com"
  layout 'mailer'
end
