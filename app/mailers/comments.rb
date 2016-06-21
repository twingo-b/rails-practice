class Comments < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comments.post_notification.subject
  #
  def post_notification(blog, entry, comment)
    @blog = blog
    @entry = entry
    @comment = comment

    mail(
        to: ENV['MAIL_TO'] || "admin@example.com",
        subject: "新しいコメントが登録されました"
    ) do |format|
      format.text
    end
  end
end
