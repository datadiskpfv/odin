class EmailVerificationJob
  def perform(email_id)
    email = Email.find(email_id)
  end
end