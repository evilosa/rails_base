class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: @user.email, subject: I18n.t('mail.new_ticket_subject'))
  end

  def delete_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: @user.email, subject: I18n.t('mail.delete_ticket_subject'))
  end
end
