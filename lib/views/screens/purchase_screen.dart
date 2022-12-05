import 'package:autoservice_app/providers/product.dart';
import 'package:autoservice_app/views/widgets/cart_summary.dart';
import 'package:autoservice_app/views/widgets/custom_btn.dart';
import 'package:autoservice_app/views/widgets/fallback.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/products.dart';
import '../../themes/autoservice_theme.dart';
import '../widgets/cart_item.dart';

/// TODO:

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).items;
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: Row(
          children: [
            buildCustomLeftColumn(products),
            buildCustomRightColumn(),
          ],
        ),
      ),
    );
  }

  //BUILDS LEFT COLUMN WITH THE LIST OF PRODUCTS
  Expanded buildCustomLeftColumn(List<Product> products) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: const EdgeInsets.all(20),
        color: AutoserviceTheme.light().backgroundColor,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Sus Articulos",
              style: AutoserviceTheme.lightTextTheme.headline1,
            ),
          ),
          Container(
            // color: AutoserviceTheme.light().backgroundColor,
            margin: const EdgeInsets.all(20),
            child: ListView.builder(
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
            ),
          )
        ]),
      ),
    );
  }

  // BUILD THE RIGHT COLUMN WITH THE CART SUMMARY COMPONENT AND THE BUTTONS-BOX
  Expanded buildCustomRightColumn() {
    return Expanded(
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
                child: const CartSummary(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                // color: AutoserviceTheme.light().backgroundColor,
                margin: const EdgeInsets.all(20),
                child: buildButtonsBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //BUILDS THE A BOX WITH TWO BUTTONS
  buildButtonsBox() {
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

// class _ButtonsBox extends StatelessWidget {
//   const _ButtonsBox({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         CustomButton(
//             text: "Siguiente",
//             color: Colors.green,
//             textColor: Colors.white,
//             action: () {
//               // cancelar boton si no hay producto en la lista
//               // Navegar pantalla metodo de pago
//             }),
//         CustomButton(
//             text: "Cancelar",
//             color: Colors.red,
//             textColor: Colors.white,
//             action: () {
//               // Cancelar estado de la compra
//               // solicitar confirmacion mediante un dialogo o alerta
//               // Navegar a la pantalla principal
//             }),
//       ],
//     );
//   }
// }

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
