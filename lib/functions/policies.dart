import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Policies extends StatefulWidget {
  const Policies({super.key});

  @override
  _PoliciesState createState() => _PoliciesState();
}

class _PoliciesState extends State<Policies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.black,
                      size: 30,
                    ),
                    Text(
                      'Regresar',
                      style: GoogleFonts.interTight(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        //fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Image.asset(
                'assets/img/logo.png'), // Ajusta la ruta según tu imagen
            const SizedBox(height: 16.0),
            Text(
              'POLÍTICA DE PRIVACIDAD',
              style: GoogleFonts.interTight(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                //fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'El presente documento establece los términos en que CapTus, una agencia de conductores, usa y protege la información proporcionada por sus usuarios al utilizar nuestro sitio web y aplicaciones móviles. CapTus está comprometida con la seguridad de los datos de sus usuarios. Cuando solicitamos que complete información personal que permita identificarle, lo hacemos garantizando que será utilizada conforme a los términos de esta política. Sin embargo, este documento puede ser modificado o actualizado con el tiempo, por lo que le recomendamos revisar esta página periódicamente para asegurarse de que está de acuerdo con dichos cambios.',
              style: GoogleFonts.interTight(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 15,

                //fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Información que se recoge',
              style: GoogleFonts.interTight(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                //fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Nuestro sitio web y aplicaciones móviles pueden recopilar información personal, como su nombre, información de contacto (correo electrónico, número de teléfono) e información demográfica. En caso de ser necesario, se podrá solicitar información específica para procesar pedidos, reservas o facturación.',
              style: GoogleFonts.interTight(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 15,

                //fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Uso de la información recogida',
              style: GoogleFonts.interTight(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 15,
                  fontWeight: FontWeight.bold

                //fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'La información que recopilamos se utiliza para ofrecerle el mejor servicio posible, mantener un registro de usuarios y solicitudes, y mejorar nuestros productos y servicios. Es posible que se envíen correos electrónicos o notificaciones en la aplicación con ofertas especiales, nuevos servicios y otra información que consideremos relevante para usted. Estos correos y notificaciones se enviarán a la dirección o dispositivo proporcionado y pueden ser cancelados en cualquier momento.',
              style: GoogleFonts.interTight(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 15,

                //fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'CapTus se compromete a garantizar la seguridad de su información. Utilizamos sistemas avanzados y los actualizamos constantemente para prevenir accesos no autorizados.',
              style: GoogleFonts.interTight(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 15,

                //fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Cookies y tecnologías similares',
              style: GoogleFonts.interTight(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 15,
                  fontWeight: FontWeight.bold

                //fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Las cookies son archivos que se almacenan en su dispositivo para mejorar la experiencia de usuario. Nuestro sitio web utiliza cookies para identificar las páginas visitadas y analizar la frecuencia de uso, lo que nos ayuda a optimizar nuestros servicios. Las aplicaciones móviles pueden usar tecnologías similares para rastrear la interacción con la aplicación y mejorar su funcionalidad. Las cookies y tecnologías similares no acceden a su información personal ni a su dispositivo, a menos que usted lo permita. Usted puede aceptar o rechazar el uso de cookies desde la configuración de su navegador o dispositivo. Tenga en cuenta que, si decide rechazarlas, es posible que algunos de nuestros servicios no funcionen correctamente.',
              style: GoogleFonts.interTight(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 15,

                //fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Enlaces a Terceros',
              style: GoogleFonts.interTight(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 15,
                  fontWeight: FontWeight.bold

                //fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Nuestro sitio web y aplicaciones móviles pueden contener enlaces a sitios externos que podrían ser de su interés. Una vez que haga clic en estos enlaces y abandone nuestra plataforma, CapTus no tiene control sobre esos sitios y no es responsable de sus términos de privacidad ni de la protección de sus datos. Le recomendamos revisar las políticas de privacidad de dichos sitios para asegurarse de que está de acuerdo con sus términos.',
              style: GoogleFonts.interTight(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 15,

                //fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Control de su información personal',
              style: GoogleFonts.interTight(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 15,
                  fontWeight: FontWeight.bold

                //fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'En cualquier momento, usted puede restringir la recopilación o el uso de su información personal en nuestro sitio web o aplicaciones móviles. Cuando se le pida completar un formulario, como el de registro de usuario, tendrá la opción de recibir o no información por correo electrónico o notificaciones. Si ha aceptado recibir nuestro boletín o publicidad, puede cancelarlo en cualquier momento.',
              style: GoogleFonts.interTight(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 15,

                //fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'CapTus no venderá, cederá ni distribuirá su información personal sin su consentimiento, salvo que sea requerido por una orden judicial.',
              style: GoogleFonts.interTight(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 15,
                  fontWeight: FontWeight.bold

                //fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'CapTus se reserva el derecho de cambiar los términos de esta Política de Privacidad en cualquier momento.',
              style: GoogleFonts.interTight(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 15,
                  fontWeight: FontWeight.bold

                //fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Text(
                'powered by DstudioVisual',
                style: GoogleFonts.interTight(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 15,
                    fontWeight: FontWeight.bold

                  //fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
