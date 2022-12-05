import 'package:flutter/material.dart';
import '../../themes/autoservice_theme.dart';

///TODO: cambiar icono configuracion
///funcionalidad boton configuracion: requerir login
/// Navegar  a la pantalla de compra
///

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                const Color(0x2C000000).withOpacity(0.4), BlendMode.darken),
            fit: BoxFit.cover,
            image: const AssetImage('assets/supermarket.webp'),
          ),
        ),
        child: Stack(children: [
          Positioned(
            top: 30,
            right: 30,
            child: MaterialButton(
              onPressed: () {
                //TODO: Navigate to Config screen
                //1- requerir autorizacion previamente(login)
              },
              child: const Icon(
                Icons.settings,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 90,
            child: MaterialButton(
              onPressed: () {
                //TODO: Navigate to Config screen
                //1- requerir autorizacion previamente(login)
              },
              child: const Icon(
                Icons.settings_suggest_sharp,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Bienvenido a la Terminal de AutoCompra",
                  style: AutoserviceTheme.darkTextTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                MaterialButton(
                  color: const Color(0xFF334248),
                  onPressed: () {
                    //TODO: navigate to Purchase Screen.
                    // Navigator.of(context).pushNamed("purchase_screen");
                    // 1- check ticket api
                    // 2- check printer
                    // 3- check internet connection
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      "Presionar para iniciar",
                      style: AutoserviceTheme.darkTextTheme.headline2,
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
