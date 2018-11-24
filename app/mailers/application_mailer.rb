class ApplicationMailer < ActionMailer::Base
  add_template_helper(email_helper)
  default from: 'stillgrowing@sproutfree.ca'
  layout 'mailer'
end
