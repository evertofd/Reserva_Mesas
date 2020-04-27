# Preview all emails at http://localhost:3000/rails/mailers/contac_mailer
class ContacMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contac_mailer/formulariocontacto
  def formulariocontacto
    ContacMailer.formulariocontacto
  end

end
