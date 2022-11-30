import 'package:flutter/material.dart';
import '../../themes/autoservice_theme.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 4),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: 50,
                      // color: AutoserviceTheme.light().backgroundColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Detalle del Ticket",
                      style: AutoserviceTheme.lightTextTheme.headline2,
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 30, 24, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Items', style: AutoserviceTheme.lightTextTheme.headline6),
                Text('\$24.20',
                    style: AutoserviceTheme.lightTextTheme.headline6),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Descuentos',
                    style: AutoserviceTheme.lightTextTheme.headline6),
                Text('\$40.00',
                    style: AutoserviceTheme.lightTextTheme.headline6),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 4, 24, 24),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal',
                    style: AutoserviceTheme.lightTextTheme.headline6),
                Text('\$230.20',
                    style: AutoserviceTheme.lightTextTheme.headline6),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 20, 20, 24),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: AutoserviceTheme.lightTextTheme.headline2),
                Text('\$230.20',
                    style: AutoserviceTheme.lightTextTheme.headline6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
