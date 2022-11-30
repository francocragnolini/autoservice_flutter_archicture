import 'package:autoservice_app/views/widgets/cart_summary.dart';
import 'package:autoservice_app/views/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/products.dart';
import '../../themes/autoservice_theme.dart';
import '../widgets/cart_item.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).items;
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.all(20),
                color: AutoserviceTheme.light().backgroundColor,
                child: Column(children: [
                  Container(
                    color: Colors.red,
                  ),
                  Text(
                    "Sus Articulos",
                    style: AutoserviceTheme.lightTextTheme.headline1,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return CartItem(
                        id: product.id,
                        name: product.title,
                        price: 13.3,
                        description: product.description,
                        imageUrl: product.imageUrl,
                      );
                    },
                  )
                ]),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                // color: Colors.green,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: AutoserviceTheme.light().backgroundColor,
                        margin: const EdgeInsets.all(20),
                        child: CartSummary(),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        // color: AutoserviceTheme.light().backgroundColor,
                        margin: const EdgeInsets.all(20),
                        child: _ButtonsBox(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonsBox extends StatelessWidget {
  const _ButtonsBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButton(
            text: "Siguiente",
            color: Colors.green,
            textColor: Colors.white,
            action: () {
              // cancelar boton si no hay producto en la lista
              // Navegar pantalla metodo de pago
            }),
        CustomButton(
            text: "Cancelar",
            color: Colors.red,
            textColor: Colors.white,
            action: () {
              // Cancelar estado de la compra
              // solicitar confirmacion mediante un dialogo o alerta
              // Navegar a la pantalla principal
            }),
      ],
    );
  }
}

// BASE LAYOUT 4 SCREENS HAVE THE SAME LAYOUT
// class _MainLayout extends StatelessWidget {
//   const _MainLayout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Container(
//             color: Colors.yellow,
//             child: Container(
//               margin: const EdgeInsets.all(20),
//               color: AutoserviceTheme.light().backgroundColor,
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             color: Colors.green,
//             child: Column(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     color: AutoserviceTheme.light().backgroundColor,
//                     margin: const EdgeInsets.all(20),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     color: AutoserviceTheme.light().backgroundColor,
//                     margin: const EdgeInsets.all(20),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
