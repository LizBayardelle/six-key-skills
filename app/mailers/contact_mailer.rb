class ContactMailer < ApplicationMailer
  def new_contact_us(contact)
    @contact = contact
    mail(
      to: "liz@sixkeyskills.com"),
      subject: 'New Contact Us Submission on 6KS'
    )
  end
end
