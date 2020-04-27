class ContacMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contac_mailer.formulariocontacto.subject
  #
  def formulariocontacto(contacto)

    @contacto = contacto.body
    @greeting = "El usuario #{contacto.email} ha realizado una consulta:"

    mail(to: "everto.fariasd2@gmail.com", subject: contacto.title)
  end
end
