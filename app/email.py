from flask_mail_sendgrid import MailSendGrid
from flask import Flask, render_template, current_app
from flask_mail import Message


from app import app
mail = MailSendGrid(app)
def send_password_reset_email(user):
    token = user.get_reset_password_token()
    msg = Message(sender='me@testapp.com',
                  recipients=[user.email],
                  subject='Reset Your Password',
                  body=render_template('email/reset_password.html', user=user, token=token),
                  html=render_template('email/reset_password.html', user=user, token=token)
                  )
    msg.body = "Send from password reset form in application."
    mail.send(msg)
