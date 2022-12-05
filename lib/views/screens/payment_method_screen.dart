import 'dart:developer';

import 'package:autoservice_app/themes/autoservice_theme.dart';
import 'package:flutter/material.dart';

import '../widgets/cart_summary.dart';
import '../widgets/custom_btn.dart';

//TODO: add a new parameter to the function _buildPayMethodItem
// type: function to make work the gesture detector
// Add navigation: button "volver", to payMethodItem "efectivo"

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _RowLayout(),
      ),
    );
  }
}

class _RowLayout extends StatelessWidget {
  const _RowLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildCustomLeftColumn(),
        buildCustomRightColumn(),
      ],
    );
  }

  Expanded buildCustomLeftColumn() {
    return Expanded(
      flex: 2,
      child: Container(
        margin: const EdgeInsets.all(20),
        color: AutoserviceTheme.light().backgroundColor,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            "Seleccione un metodo de pago",
            style: AutoserviceTheme.lightTextTheme.headline1,
          ),
          _buildPayMethodItem(Icons.credit_card, "Card"),
          _buildPayMethodItem(Icons.qr_code, "Qr"),
        ]),
      ),
    );
  }

  Widget _buildPayMethodItem(IconData icon, String description) {
    return GestureDetector(
      onTap: () {
        log("gesture detector tapped");
      },
      child: Container(
        width: 450,
        decoration: BoxDecoration(
          color: const Color(0xFF283237),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Icon(
                  icon,
                  size: 175,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
            text: "Volver",
            color: Colors.red,
            textColor: Colors.white,
            action: () {
              // cancelar boton si no hay producto en la lista
              // Navegar pantalla metodo de pago
            }),
      ],
    );
  }
}
