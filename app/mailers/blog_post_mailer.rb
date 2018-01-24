class BlogPostMailer < ApplicationMailer
  def blog_post(blog)
    @blog = blog
    @user_email = @blog.user.email
    # binding.pry
    mail to: @user_email, subject: "ブログ内容の確認メール"
  end
end
