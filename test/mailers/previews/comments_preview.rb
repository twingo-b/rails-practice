# Preview all emails at http://localhost:3000/rails/mailers/comments
class CommentsPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/comments/post_notification
  def post_notification
    blog = Blog.create!(title: 'Title')
    entry = blog.entries.create!(title: 'Title', body: 'Body')
    comment = entry.comments.create!(body: 'Body')
    mail = Comments.post_notification(blog, entry, comment)
    blog.destroy
    mail
  end

end
