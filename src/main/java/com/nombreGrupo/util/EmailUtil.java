package com.nombreGrupo.util;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class EmailUtil {

  @Autowired
  private JavaMailSender javaMailSender;

  public void enviarEmailConOtp(String nombreDestinatario, String direccionEmail, String otp) throws MessagingException {
    MimeMessage mimeMessage = javaMailSender.createMimeMessage();
    MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage);
    mimeMessageHelper.setTo(direccionEmail);
    mimeMessageHelper.setSubject("[nombrePagina.com] ¡Bienvenido!");
    mimeMessageHelper.setText("""
        <div>
          <p>Hola %s</p>
          <p>Gracias por crear una cuenta de usuario en nombre pagina.</p>
          <a href="http://localhost:8080/no-verificados/verificar-cuenta?direccionEmail=%s&otp=%s" target="_blank">Haz click aquí para verificar tu dirección de email y completar el registro.</a>
          <p>Saludos</p>
        </div>
        """.formatted(nombreDestinatario, direccionEmail, otp), true);

    javaMailSender.send(mimeMessage);
  }
}
